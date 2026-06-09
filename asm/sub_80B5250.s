	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_80B5250, "ax", %progbits
@ sub_80B5250 @ JP 0x080B5250 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B5250
	.thumb_func
sub_80B5250:
	push {lr}
	sub sp, #4
	ldr r0, _080B5284 @ =0x08A9D958
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x18
	movs r2, #8
	bl PutSpriteExt
	ldr r0, _080B5288 @ =0x08A9D94C
	ldr r3, [r0]
	movs r0, #0x90
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x18
	movs r2, #0x10
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080B5284: .4byte 0x08A9D958
_080B5288: .4byte 0x08A9D94C

