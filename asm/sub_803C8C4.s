	.syntax unified
	.set AreUnitsAllied, 0x08024D3C + 1
	.section .text.sub_803C8C4, "ax", %progbits
@ sub_803C8C4 @ JP 0x0803C8C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803C8C4
	.thumb_func
sub_803C8C4:
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #4]
	ldrb r1, [r0, #4]
	ldr r0, _0803C8F4 @ =0x030017C8
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r1, r0
	bne _0803C8FC
	ldr r0, _0803C8F8 @ =0x03004DF0
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C8FC
	movs r0, #1
	b _0803C8FE
	.align 2, 0
_0803C8F4: .4byte 0x030017C8
_0803C8F8: .4byte 0x03004DF0
_0803C8FC:
	movs r0, #0
_0803C8FE:
	pop {r1}
	bx r1
	.align 2, 0

