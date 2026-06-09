	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_809A804, "ax", %progbits
@ sub_809A804 @ JP 0x0809A804 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A804
	.thumb_func
sub_809A804:
	push {lr}
	sub sp, #4
	adds r2, r0, #0
	ldr r0, [r2, #0x34]
	cmp r0, #0
	beq _0809A822
	ldr r1, [r2, #0x2c]
	ldr r2, [r2, #0x30]
	ldr r3, _0809A828 @ =0x08A946A8
	movs r0, #0x96
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
_0809A822:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809A828: .4byte 0x08A946A8

