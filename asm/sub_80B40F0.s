	.syntax unified
	.set PutNumber, 0x08004A90 + 1
	.set PutText, 0x08003DA0 + 1
	.section .text.sub_80B40F0, "ax", %progbits
@ sub_80B40F0 @ JP 0x080B40F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B40F0
	.thumb_func
sub_80B40F0:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r6, _080B412C @ =0x0201F160
	adds r0, r6, #0
	adds r1, r5, #0
	bl PutText
	adds r3, r5, #0
	adds r3, #0xc
	adds r4, #0x34
	ldrb r0, [r4]
	movs r1, #2
	cmp r0, #0x64
	bne _080B4110
	movs r1, #4
_080B4110:
	ldrb r2, [r4]
	adds r0, r3, #0
	bl PutNumber
	adds r0, r6, #0
	adds r0, #0x30
	adds r1, r5, #0
	adds r1, #0xe
	bl PutText
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B412C: .4byte 0x0201F160

