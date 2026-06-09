	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.section .text.sub_8082F18, "ax", %progbits
@ sub_8082F18 @ JP 0x08082F18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8082F18
	.thumb_func
sub_8082F18:
	push {r4, r5, r6, lr}
	mov ip, r0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08082F44
	ldr r0, _08082F40 @ =0x0202BCAC
	mov r2, ip
	ldrh r1, [r2, #0x2c]
	strh r1, [r0, #0xc]
	ldrh r1, [r2, #0x2e]
	strh r1, [r0, #0xe]
	movs r0, #2
	movs r1, #8
	movs r2, #8
	bl BG_SetPosition
	b _0808305C
	.align 2, 0
_08082F40: .4byte 0x0202BCAC
_08082F44:
	mov r3, ip
	ldrh r1, [r3, #0x36]
	movs r4, #0x36
	ldrsh r0, [r3, r4]
	cmp r0, #0
	ble _08082F56
	subs r0, r1, #1
	strh r0, [r3, #0x36]
	b _0808305C
_08082F56:
	mov r5, ip
	ldrh r0, [r5, #0x34]
	strh r0, [r5, #0x36]
	movs r6, #0x2a
	ldrsh r0, [r5, r6]
	cmp r0, #1
	beq _08082FA0
	cmp r0, #1
	bgt _08082F6E
	cmp r0, #0
	beq _08082F74
	b _08082FF8
_08082F6E:
	cmp r0, #2
	beq _08082FCC
	b _08082FF8
_08082F74:
	ldr r2, _08082F9C @ =0x081F52B0
	mov r1, ip
	adds r1, #0x38
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r3, ip
	strh r0, [r3, #0x30]
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r3, #0x32]
	b _08083022
	.align 2, 0
_08082F9C: .4byte 0x081F52B0
_08082FA0:
	ldr r2, _08082FC8 @ =0x081F52D0
	mov r1, ip
	adds r1, #0x38
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r4, ip
	strh r0, [r4, #0x30]
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #0x32]
	b _08083022
	.align 2, 0
_08082FC8: .4byte 0x081F52D0
_08082FCC:
	ldr r2, _08082FF4 @ =0x081F52F0
	mov r1, ip
	adds r1, #0x38
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r5, ip
	strh r0, [r5, #0x30]
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5, #0x32]
	b _08083022
	.align 2, 0
_08082FF4: .4byte 0x081F52F0
_08082FF8:
	ldr r3, _08083064 @ =0x081F52D0
	mov r1, ip
	adds r1, #0x38
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r6, ip
	ldrh r2, [r6, #0x2a]
	muls r0, r2, r0
	strh r0, [r6, #0x30]
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	muls r0, r2, r0
	strh r0, [r6, #0x32]
_08083022:
	adds r4, r1, #0
	ldr r3, _08083068 @ =0x0202BCAC
	mov r0, ip
	ldrh r1, [r0, #0x30]
	ldrh r2, [r0, #0x2c]
	adds r0, r1, r2
	strh r0, [r3, #0xc]
	mov r5, ip
	ldrh r2, [r5, #0x32]
	ldrh r6, [r5, #0x2e]
	adds r0, r2, r6
	strh r0, [r3, #0xe]
	adds r1, #8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, #8
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl BG_SetPosition
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r0, [r4]
	cmp r0, #8
	blt _0808305C
	movs r0, #0
	strb r0, [r4]
_0808305C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08083064: .4byte 0x081F52D0
_08083068: .4byte 0x0202BCAC

