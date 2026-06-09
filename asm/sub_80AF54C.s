	.syntax unified
	.set ClearBgVerticalScrollChannelFlags, 0x08014F1C + 1
	.set SaveDraw_InitParticles, 0x080B0004 + 1
	.set SetBgVerticalScrollPosition, 0x08014EEC + 1
	.set StartBgVerticalScroll, 0x08014DD0 + 1
	.set sub_8002100, 0x08002100 + 1
	.set sub_8009608, 0x08009608 + 1
	.set sub_80AF4B8, 0x080AF4B8 + 1
	.set sub_80AFFF0, 0x080AFFF0 + 1
	.section .text.sub_80AF54C, "ax", %progbits
@ sub_80AF54C @ JP 0x080AF54C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AF54C
	.thumb_func
sub_80AF54C:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x29
	movs r7, #0
	movs r0, #1
	strb r0, [r1]
	movs r5, #0
	strh r7, [r6, #0x2c]
	movs r4, #0x80
	lsls r4, r4, #1
	strh r4, [r6, #0x2e]
	adds r0, r6, #0
	adds r0, #0x3a
	strb r5, [r0]
	adds r1, #0x12
	movs r0, #0x28
	strb r0, [r1]
	strh r7, [r6, #0x30]
	adds r0, r6, #0
	adds r0, #0x32
	strb r5, [r0]
	str r4, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8002100
	str r4, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8002100
	str r4, [sp]
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8002100
	str r4, [sp]
	movs r0, #3
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8002100
	strh r7, [r6, #0x2a]
	adds r0, r6, #0
	bl sub_80AFFF0
	str r0, [r6, #0x34]
	adds r0, r6, #0
	adds r0, #0x39
	strb r5, [r0]
	ldr r1, [r6, #0x14]
	adds r2, r1, #0
	adds r2, #0x3f
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _080AF5D2
	str r7, [r1, #0x60]
	b _080AF5F0
_080AF5D2:
	ldr r0, _080AF638 @ =0x08AA52FC
	movs r1, #0xa0
	lsls r1, r1, #1
	ldrb r2, [r2]
	lsls r2, r2, #5
	adds r2, #0x30
	movs r3, #0xc5
	lsls r3, r3, #6
	str r7, [sp]
	movs r4, #4
	str r4, [sp, #4]
	bl sub_8009608
	ldr r1, [r6, #0x14]
	str r0, [r1, #0x60]
_080AF5F0:
	ldr r0, [r6, #0x14]
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r0, r6, #0
	adds r0, #0x3c
	movs r1, #0
	strb r2, [r0]
	adds r0, #4
	strh r1, [r0]
	strh r1, [r6, #0x3e]
	ldr r0, _080AF63C @ =0x02000000
	bl StartBgVerticalScroll
	ldr r1, _080AF640 @ =0x04000018
	movs r0, #0
	bl SetBgVerticalScrollPosition
	movs r0, #0
	bl ClearBgVerticalScrollChannelFlags
	adds r0, r6, #0
	bl sub_80AF4B8
	ldr r0, _080AF644 @ =0x03004930
	ldr r0, [r0]
	ldr r1, _080AF648 @ =0x0000079E
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	bl SaveDraw_InitParticles
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF638: .4byte 0x08AA52FC
_080AF63C: .4byte 0x02000000
_080AF640: .4byte 0x04000018
_080AF644: .4byte 0x03004930
_080AF648: .4byte 0x0000079E

