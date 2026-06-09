	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_80C83A4, "ax", %progbits
@ sub_80C83A4 @ JP 0x080C83A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C83A4
	.thumb_func
sub_80C83A4:
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C83D0
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _080C83C0
	movs r2, #0x6f
_080C83C0:
	ldr r3, _080C83D8 @ =0x08AC27E8
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	bl PutSpriteExt
_080C83D0:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080C83D8: .4byte 0x08AC27E8

