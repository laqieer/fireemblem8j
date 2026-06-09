	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8008830, 0x08008830 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_8007A08, "ax", %progbits
@ sub_8007A08 @ JP 0x08007A08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8007A08
	.thumb_func
sub_8007A08:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	cmp r2, #0x10
	ble _08007A7C
	adds r1, r2, #0
	cmp r2, #0
	bge _08007A1C
	adds r1, r2, #7
_08007A1C:
	asrs r1, r1, #3
	ldr r0, [r4, #0x58]
	adds r5, r4, #0
	adds r5, #0x64
	cmp r0, r1
	bne _08007A3A
	ldr r1, _08007A78 @ =0x03004920
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	adds r0, #1
	strh r0, [r1, #0x36]
_08007A3A:
	ldr r0, [r4, #0x5c]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r1, [r4, #0x58]
	cmp r1, r0
	bne _08007A5A
	ldr r1, _08007A78 @ =0x03004920
	movs r3, #0
	ldrsh r0, [r5, r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	subs r0, #1
	strh r0, [r1, #0x36]
_08007A5A:
	ldr r1, [r4, #0x5c]
	lsls r0, r1, #2
	adds r0, r0, r1
	cmp r0, #0
	bge _08007A66
	adds r0, #7
_08007A66:
	asrs r1, r0, #3
	ldr r0, [r4, #0x58]
	cmp r0, r1
	bne _08007A9E
	ldr r1, _08007A78 @ =0x03004920
	movs r2, #0
	ldrsh r0, [r5, r2]
	b _08007A92
	.align 2, 0
_08007A78: .4byte 0x03004920
_08007A7C:
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r0, r0, #1
	ldr r1, [r4, #0x58]
	adds r5, r4, #0
	adds r5, #0x64
	cmp r1, r0
	bne _08007A9E
	ldr r1, _08007AC0 @ =0x03004920
	movs r3, #0
	ldrsh r0, [r5, r3]
_08007A92:
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	adds r0, #1
	strh r0, [r1, #0x36]
_08007A9E:
	ldr r1, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	cmp r1, r0
	blt _08007AC4
	ldr r1, _08007AC0 @ =0x03004920
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	subs r0, #1
	strh r0, [r1, #0x36]
	adds r0, r4, #0
	bl sub_8002DE4
	b _08007AFC
	.align 2, 0
_08007AC0: .4byte 0x03004920
_08007AC4:
	adds r0, r4, #0
	adds r0, #0x66
	movs r3, #0
	ldrsh r0, [r0, r3]
	bl sub_8008830
	adds r2, r0, #0
	lsls r2, r2, #3
	adds r0, r4, #0
	adds r0, #0x68
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r4, #0x58]
	adds r3, r0, #0
	adds r0, #1
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	str r0, [sp]
	movs r0, #4
	bl sub_8012E84
	ldr r2, _08007B04 @ =0x03004920
	movs r3, #0
	ldrsh r1, [r5, r3]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	strh r0, [r1, #0x34]
_08007AFC:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007B04: .4byte 0x03004920

