	.syntax unified
	.set sub_80737A4, 0x080737A4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8079708, "ax", %progbits
@ sub_8079708 @ JP 0x08079708 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8079708
	.thumb_func
sub_8079708:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0807972C @ =0x080E6544
	ldr r4, _08079730 @ =0x02022928
	adds r1, r4, #0
	movs r2, #8
	bl sub_80D636C
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	adds r3, r5, #0
	bl sub_80737A4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807972C: .4byte 0x080E6544
_08079730: .4byte 0x02022928

