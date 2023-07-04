void
horizgrid(Monitor *m) {
	Client *c;
	unsigned int n, i, oe = enablegaps, ie = enablegaps, iv, ih, ov, oh, cw, cx;
	int w = 0;
	int ntop, nbottom = 0;

	/* Count windows */
	for(n = 0, c = nexttiled(m->clients); c; c = nexttiled(c->next), n++);

	if(n == 0)
		return;

	if (smartgaps == n) {
		oe = 0; // outer gaps disabled
	}

    iv = m->gappiv * ie;
    ih = m->gappih * ie;
    ov = m->gappov * oe;
    oh = m->gappoh * oe;

	if(n == 1) { /* Just fill the whole screen */
		c = nexttiled(m->clients);
		resize(c, m->wx + oh, m->wy + ov, m->ww - (2*c->bw) - (2*oh), m->wh - (2*c->bw) - (2*ov), False);
	} else if(n == 2) { /* Split vertically */
		w = m->ww / 2;
		c = nexttiled(m->clients);
		resize(c, m->wx + oh, m->wy + ov, w - (2*c->bw) - oh - ih / 2, m->wh - (2*c->bw) - (2*ov), False);
		c = nexttiled(c->next);
		resize(c, m->wx + w + ih / 2, m->wy + ov, w - (2*c->bw) - oh - ih / 2, m->wh - (2*c->bw) - (2*ov), False);
	} else {
		ntop = n / 2;
		nbottom = n - ntop;
        cx = m->wx + oh;
		for(i = 0, c = nexttiled(m->clients); c; c = nexttiled(c->next), i++) {
			if(i < ntop) {
                cw = (m->ww - 2 * oh - (ntop - 1) * ih) / ntop;
				resize(c, cx, m->wy + ov, cw, m->wh / 2 - (2*c->bw) - ov - iv / 2, False);
                cx += cw + ih;
            } else {
                if (i == ntop) cx = m->wx + oh;
                cw = (m->ww - 2 * oh - (nbottom - 1) * ih) / nbottom;
				resize(c, cx, m->wy + m->wh / 2 + iv / 2, cw, m->wh / 2 - (2*c->bw) - ov - iv / 2, False);
                cx += cw + ih;
            }
		}
	}
}
