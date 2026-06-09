	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_80B51DC, "ax", %progbits
@ sub_80B51DC @ JP 0x080B51DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B51DC
	.thumb_func
sub_80B51DC:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	cmp r0, #0
	blt _080B5214
	ldr r3, _080B521C @ =0x08A9D448
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	movs r2, #8
	bl PutSpriteExt
	ldr r1, _080B5220 @ =0x08A9D904
	ldr r0, [r4, #0x58]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x40
	movs r2, #0x10
	bl PutSpriteExt
_080B5214:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B521C: .4byte 0x08A9D448
_080B5220: .4byte 0x08A9D904

