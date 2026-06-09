	.syntax unified
	.set AreUnitsAllied, 0x08024D3C + 1
	.section .text.sub_803F570, "ax", %progbits
@ sub_803F570 @ JP 0x0803F570 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803F570
	.thumb_func
sub_803F570:
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, _0803F59C @ =0x0203AA9C
	ldrb r0, [r0, #4]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0803F5A4
	ldr r0, _0803F5A0 @ =0x03004DF0
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803F5A4
	movs r0, #1
	b _0803F5A6
	.align 2, 0
_0803F59C: .4byte 0x0203AA9C
_0803F5A0: .4byte 0x03004DF0
_0803F5A4:
	movs r0, #0
_0803F5A6:
	pop {r1}
	bx r1
	.align 2, 0

