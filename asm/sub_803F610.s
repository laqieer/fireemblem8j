	.syntax unified
	.set AreUnitsAllied, 0x08024D3C + 1
	.section .text.sub_803F610, "ax", %progbits
@ sub_803F610 @ JP 0x0803F610 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803F610
	.thumb_func
sub_803F610:
	push {lr}
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	ldr r0, _0803F638 @ =0x0203AA00
	adds r0, #0x86
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803F640
	ldr r0, _0803F63C @ =0x03004DF0
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803F640
	movs r0, #1
	b _0803F642
	.align 2, 0
_0803F638: .4byte 0x0203AA00
_0803F63C: .4byte 0x03004DF0
_0803F640:
	movs r0, #0
_0803F642:
	pop {r1}
	bx r1
	.align 2, 0

