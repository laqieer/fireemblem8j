	.syntax unified
	.set AreUnitsAllied, 0x08024D3C + 1
	.section .text.sub_803C7A8, "ax", %progbits
@ sub_803C7A8 @ JP 0x0803C7A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803C7A8
	.thumb_func
sub_803C7A8:
	push {lr}
	adds r1, r0, #0
	ldr r0, _0803C7CC @ =0x03004DF0
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1, #0xb]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C7D0
	movs r0, #1
	b _0803C7D2
	.align 2, 0
_0803C7CC: .4byte 0x03004DF0
_0803C7D0:
	movs r0, #0
_0803C7D2:
	pop {r1}
	bx r1
	.align 2, 0

