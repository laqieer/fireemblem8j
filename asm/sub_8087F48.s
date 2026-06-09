	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set FlushLCDControl, 0x08000E4C + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8088098, 0x08088098 + 1
	.section .text.sub_8087F48, "ax", %progbits
@ sub_8087F48 @ JP 0x08087F48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087F48
	.thumb_func
sub_8087F48:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r2, r0, #0
	adds r6, r1, #0
	ldr r0, _0808802C @ =0x08A60B18
	adds r1, r2, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r0, #0x64
	movs r5, #0
	strh r6, [r0]
	ldr r4, _08088030 @ =0x03003020
	ldrb r1, [r4, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	bl FlushLCDControl
	ldr r2, _08088034 @ =0x0000FFD4
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _08088038 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _0808803C @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldrb r1, [r4, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	adds r4, #0x36
	ldrb r0, [r4]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r4]
	movs r0, #1
	movs r1, #4
	movs r2, #0xc
	movs r3, #0
	bl SetBlendConfig
	str r5, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	ldr r0, _08088040 @ =0x085C8BF8
	ldr r1, _08088044 @ =0x06002000
	bl sub_8013008
	ldr r0, _08088048 @ =0x085C7F4C
	movs r1, #0xa0
	movs r2, #0x20
	bl sub_8000D68
	movs r0, #0
	movs r1, #0
	bl sub_8088098
	ldr r0, _0808804C @ =0x08A12048
	movs r1, #0
	movs r2, #0x20
	bl sub_8000D68
	cmp r6, #0
	bne _0808805C
	ldr r0, _08088050 @ =0x08A12068
	ldr r1, _08088054 @ =0x06014000
	bl sub_8013008
	ldr r0, _08088058 @ =0x08A12A80
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	b _08088070
	.align 2, 0
_0808802C: .4byte 0x08A60B18
_08088030: .4byte 0x03003020
_08088034: .4byte 0x0000FFD4
_08088038: .4byte 0x02022CA8
_0808803C: .4byte 0x020234A8
_08088040: .4byte 0x085C8BF8
_08088044: .4byte 0x06002000
_08088048: .4byte 0x085C7F4C
_0808804C: .4byte 0x08A12048
_08088050: .4byte 0x08A12068
_08088054: .4byte 0x06014000
_08088058: .4byte 0x08A12A80
_0808805C:
	ldr r0, _08088088 @ =0x08A125E4
	ldr r1, _0808808C @ =0x06014000
	bl sub_8013008
	ldr r0, _08088090 @ =0x08A12AA0
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
_08088070:
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r1, _08088094 @ =0x020228A8
	movs r0, #0
	strh r0, [r1]
	bl sub_8001EE4
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088088: .4byte 0x08A125E4
_0808808C: .4byte 0x06014000
_08088090: .4byte 0x08A12AA0
_08088094: .4byte 0x020228A8

