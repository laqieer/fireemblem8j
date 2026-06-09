	.syntax unified
	.section .text.sub_802EA88, "ax", %progbits
@ sub_802EA88 @ JP 0x0802EA88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802EA88
	.thumb_func
sub_802EA88:
	push {r4, lr}
	ldr r2, _0802EABC @ =0x0203A610
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _0802EAB4
	ldr r4, _0802EAC0 @ =0x0202E4D8
	movs r3, #0
_0802EA96:
	ldrb r0, [r2, #2]
	cmp r0, #0xd
	bne _0802EAAC
	ldrb r0, [r2, #1]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r2]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r3, [r0]
_0802EAAC:
	adds r2, #8
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _0802EA96
_0802EAB4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EABC: .4byte 0x0203A610
_0802EAC0: .4byte 0x0202E4D8

