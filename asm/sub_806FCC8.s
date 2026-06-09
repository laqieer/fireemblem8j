	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set NewEfxRestWINH_, 0x0805C6EC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_806FD38, 0x0806FD38 + 1
	.set sub_806FDAC, 0x0806FDAC + 1
	.section .text.sub_806FCC8, "ax", %progbits
@ sub_806FCC8 @ JP 0x0806FCC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806FCC8
	.thumb_func
sub_806FCC8:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806FCE2
	ldr r0, [r6, #0x5c]
	bl sub_806FD38
	b _0806FD2C
_0806FCE2:
	cmp r0, #0x15
	bne _0806FCF6
	ldr r0, [r6, #0x5c]
	movs r1, #0x2d
	movs r2, #1
	bl NewEfxRestWINH_
	bl sub_806FDAC
	b _0806FD2C
_0806FCF6:
	cmp r0, #0x46
	bne _0806FD2C
	ldr r5, _0806FD34 @ =0x02000000
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	ldrh r0, [r4, #0x10]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r4, #0x10]
	ldrh r0, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r6, #0
	bl sub_8002DE4
_0806FD2C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806FD34: .4byte 0x02000000

