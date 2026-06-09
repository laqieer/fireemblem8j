	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.section .text.SpriteRefresher_OnIdle, "ax", %progbits
@ SpriteRefresher_OnIdle @ JP 0x08005390 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SpriteRefresher_OnIdle
	.thumb_func
SpriteRefresher_OnIdle:
	push {r4, lr}
	sub sp, #4
	adds r1, r0, #0
	adds r1, #0x50
	movs r2, #0
	ldrsh r4, [r1, r2]
	ldr r1, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r3, [r0, #0x54]
	adds r0, #0x52
	ldrh r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

