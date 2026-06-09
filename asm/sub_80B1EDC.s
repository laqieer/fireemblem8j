	.syntax unified
	.set sub_8015BA4, 0x08015BA4 + 1
	.set sub_804F528, 0x0804F528 + 1
	.set sub_80B1E04, 0x080B1E04 + 1
	.section .text.sub_80B1EDC, "ax", %progbits
@ sub_80B1EDC @ JP 0x080B1EDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1EDC
	.thumb_func
sub_80B1EDC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl sub_804F528
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B1EFC
	adds r0, r4, #0
	bl sub_80B1E04
_080B1EFC:
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B1F14
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	adds r1, #2
	bl sub_8015BA4
_080B1F14:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

