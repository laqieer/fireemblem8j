	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_80C0A98, 0x080C0A98 + 1
	.set sub_80C0B0C, 0x080C0B0C + 1
	.section .text.sub_80C0F38, "ax", %progbits
@ sub_80C0F38 @ JP 0x080C0F38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C0F38
	.thumb_func
sub_80C0F38:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r2, _080C0FB8 @ =0x0300305C
	ldrh r0, [r2]
	ldr r1, _080C0FBC @ =0x0000FFC0
	ands r1, r0
	adds r5, r4, #0
	adds r5, #0x35
	movs r0, #1
	ldrb r3, [r5]
	lsls r0, r3
	orrs r1, r0
	ldr r0, _080C0FC0 @ =0x0000C0FF
	ands r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
	adds r0, r4, #0
	bl sub_80C0A98
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x37
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r2, [r5]
	bl sub_80C0B0C
	mov r2, sp
	ldr r1, [r4, #0x14]
	ldrh r0, [r1, #0x34]
	strh r0, [r2]
	mov r0, sp
	adds r0, #2
	ldrh r3, [r1, #0x36]
	strh r3, [r0]
	ldrb r0, [r5]
	mov r1, sp
	ldrh r2, [r1]
	ldr r1, _080C0FC4 @ =0x000001FF
	ands r1, r2
	movs r2, #0xff
	ands r2, r3
	bl BG_SetPosition
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C0FB8: .4byte 0x0300305C
_080C0FBC: .4byte 0x0000FFC0
_080C0FC0: .4byte 0x0000C0FF
_080C0FC4: .4byte 0x000001FF

