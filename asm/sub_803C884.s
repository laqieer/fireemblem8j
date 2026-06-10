	.syntax unified
	.set AreUnitsAllied, 0x08024D3C + 1
	.section .text.sub_803C884, "ax", %progbits
@ sub_803C884 @ JP 0x0803C884 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803C884
	.thumb_func
sub_803C884:
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2]
	ldrb r1, [r0, #4]
	ldr r0, _0803C8B4 @ =0x030017C8
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r1, r0
	bne _0803C8BC
	ldr r0, _0803C8B8 @ =0x03004DF0
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C8BC
	movs r0, #1
	b _0803C8BE
	.align 2, 0
_0803C8B4: .4byte 0x030017C8
_0803C8B8: .4byte 0x03004DF0
_0803C8BC:
	movs r0, #0
_0803C8BE:
	pop {r1}
	bx r1
	.align 2, 0

