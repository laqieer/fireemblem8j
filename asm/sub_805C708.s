	.syntax unified
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_805C708, "ax", %progbits
@ sub_805C708 @ JP 0x0805C708 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805C708
	.thumb_func
sub_805C708:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0805C734 @ =0x0202BCAC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, _0805C738 @ =0x0201FB30
	ldr r2, _0805C73C @ =0x0201FDBC
	cmp r0, #0
	beq _0805C780
	ldr r0, [r4, #0x48]
	cmp r0, #2
	bne _0805C750
	ldr r1, _0805C740 @ =0x0201FB2C
	ldr r0, [r1]
	cmp r0, #1
	bne _0805C748
	movs r0, #0
	str r0, [r1]
	ldr r0, _0805C744 @ =0x0201FB38
	b _0805C74E
	.align 2, 0
_0805C734: .4byte 0x0202BCAC
_0805C738: .4byte 0x0201FB30
_0805C73C: .4byte 0x0201FDBC
_0805C740: .4byte 0x0201FB2C
_0805C744: .4byte 0x0201FB38
_0805C748:
	movs r0, #1
	str r0, [r1]
	ldr r0, _0805C764 @ =0x0201FC78
_0805C74E:
	str r0, [r3]
_0805C750:
	ldr r1, _0805C768 @ =0x0201FDB8
	ldr r0, [r1]
	cmp r0, #1
	bne _0805C774
	movs r0, #0
	str r0, [r1]
	ldr r1, _0805C76C @ =0x0201FDBC
	ldr r0, _0805C770 @ =0x0201FDC4
	b _0805C77C
	.align 2, 0
_0805C764: .4byte 0x0201FC78
_0805C768: .4byte 0x0201FDB8
_0805C76C: .4byte 0x0201FDBC
_0805C770: .4byte 0x0201FDC4
_0805C774:
	movs r0, #1
	str r0, [r1]
	ldr r1, _0805C7B8 @ =0x0201FDBC
	ldr r0, _0805C7BC @ =0x0201FF04
_0805C77C:
	str r0, [r1]
	adds r2, r1, #0
_0805C780:
	ldr r1, _0805C7C0 @ =0x0201FB34
	ldr r0, [r3]
	str r0, [r1]
	ldr r1, _0805C7C4 @ =0x0201FDC0
	ldr r0, [r2]
	str r0, [r1]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bne _0805C7B0
	ldr r1, _0805C7C8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	movs r0, #0
	bl SetPrimaryHBlankHandler
	adds r0, r4, #0
	bl sub_8002DE4
_0805C7B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C7B8: .4byte 0x0201FDBC
_0805C7BC: .4byte 0x0201FF04
_0805C7C0: .4byte 0x0201FB34
_0805C7C4: .4byte 0x0201FDC0
_0805C7C8: .4byte 0x0201774C

