	.syntax unified
	.set RegisterShopState, 0x080BA130 + 1
	.section .text.sub_80B9310, "ax", %progbits
@ sub_80B9310 @ JP 0x080B9310 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9310
	.thumb_func
sub_80B9310:
	push {lr}
	sub sp, #0xc
	adds r1, r0, #0
	adds r1, #0x5c
	ldrb r3, [r1]
	subs r1, #1
	ldrb r1, [r1]
	movs r2, #0x48
	str r2, [sp]
	ldr r2, _080B9338 @ =sub_80B8FA0
	str r2, [sp, #4]
	str r0, [sp, #8]
	adds r0, r3, #0
	movs r2, #5
	movs r3, #0
	bl RegisterShopState
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_080B9338: .4byte 0x080B8FA1  @ sub_80B8FA0

