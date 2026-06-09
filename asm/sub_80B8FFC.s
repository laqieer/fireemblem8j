	.syntax unified
	.set RegisterShopState, 0x080BA130 + 1
	.section .text.sub_80B8FFC, "ax", %progbits
@ sub_80B8FFC @ JP 0x080B8FFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B8FFC
	.thumb_func
sub_80B8FFC:
	push {lr}
	sub sp, #0xc
	mov ip, r0
	adds r0, #0x5e
	ldrb r0, [r0]
	mov r1, ip
	adds r1, #0x5a
	ldrb r1, [r1]
	mov r2, ip
	adds r2, #0x5f
	ldrb r3, [r2]
	movs r2, #0x48
	str r2, [sp]
	ldr r2, _080B902C @ =sub_80B8F44
	str r2, [sp, #4]
	mov r2, ip
	str r2, [sp, #8]
	movs r2, #5
	bl RegisterShopState
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_080B902C: .4byte 0x080B8F45  @ sub_80B8F44

