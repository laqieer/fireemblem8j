	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.section .text.sub_808B3DC, "ax", %progbits
@ sub_808B3DC @ JP 0x0808B3DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B3DC
	.thumb_func
sub_808B3DC:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_808B2A4
	adds r0, r4, #0
	bl Proc_End
	pop {r4}
	pop {r0}
	bx r0

