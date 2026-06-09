	.syntax unified
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_8013B3C, "ax", %progbits
@ sub_8013B3C @ JP 0x08013B3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013B3C
	.thumb_func
sub_8013B3C:
	push {lr}
	adds r1, r0, #0
	ldr r0, _08013B54 @ =0x085C25A0
	lsls r1, r1, #5
	ldr r2, _08013B58 @ =0x020228A8
	adds r1, r1, r2
	movs r2, #0x10
	bl sub_80D6370
	pop {r0}
	bx r0
	.align 2, 0
_08013B54: .4byte 0x085C25A0
_08013B58: .4byte 0x020228A8

