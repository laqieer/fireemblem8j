	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_803290C, "ax", %progbits
@ sub_803290C @ JP 0x0803290C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803290C
	.thumb_func
sub_803290C:
	push {r4, lr}
	ldr r4, _08032920 @ =0x0203A970
	adds r1, r4, #0
	movs r2, #7
	bl sub_80D636C
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08032920: .4byte 0x0203A970

