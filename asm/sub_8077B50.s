	.syntax unified
	.set AnimSort, 0x08004EB4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_8077B50, "ax", %progbits
@ NewEkrTriArmorKnightOBJ2 @ JP 0x08077B50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewEkrTriArmorKnightOBJ2
	.thumb_func
NewEkrTriArmorKnightOBJ2:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _08077B8C @ =0x087A9B80
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	mov r0, r8
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #5
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	adds r0, #0x29
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	cmp r5, #0
	bne _08077B94
	ldr r0, _08077B90 @ =0x0203E198
	ldr r0, [r0]
	b _08077B98
	.align 2, 0
_08077B8C: .4byte 0x087A9B80
_08077B90: .4byte 0x0203E198
_08077B94:
	ldr r0, _08077BA4 @ =0x0203E198
	ldr r0, [r0, #4]
_08077B98:
	mov sb, r0
	cmp r6, #0
	bne _08077BB0
	ldr r3, _08077BA8 @ =0x087AA6D0
	ldr r6, _08077BAC @ =0x080EBB6C
	b _08077BDC
	.align 2, 0
_08077BA4: .4byte 0x0203E198
_08077BA8: .4byte 0x087AA6D0
_08077BAC: .4byte 0x080EBB6C
_08077BB0:
	cmp r7, #1
	beq _08077BC8
	cmp r7, #1
	bhs _08077BD8
	ldr r3, _08077BC0 @ =0x087AA848
	ldr r6, _08077BC4 @ =0x080EC0A4
	b _08077BDC
	.align 2, 0
_08077BC0: .4byte 0x087AA848
_08077BC4: .4byte 0x080EC0A4
_08077BC8:
	ldr r3, _08077BD0 @ =0x087AA99C
	ldr r6, _08077BD4 @ =0x080EC7E0
	b _08077BDC
	.align 2, 0
_08077BD0: .4byte 0x087AA99C
_08077BD4: .4byte 0x080EC7E0
_08077BD8:
	ldr r3, _08077C08 @ =0x087AAC64
	ldr r6, _08077C0C @ =0x080ECF6C
_08077BDC:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	adds r1, r0, #0
	str r1, [r4, #0x60]
	cmp r5, #0
	bne _08077C10
	ldrh r0, [r1, #4]
	adds r0, #0xa
	strh r0, [r1, #4]
	ldr r1, [r4, #0x60]
	movs r0, #0x78
	strh r0, [r1, #0xa]
	bl AnimSort
	ldr r0, [r4, #0x5c]
	ldrh r1, [r0, #2]
	adds r1, #0x10
	b _08077C26
	.align 2, 0
_08077C08: .4byte 0x087AAC64
_08077C0C: .4byte 0x080ECF6C
_08077C10:
	ldrh r0, [r1, #4]
	adds r0, #2
	strh r0, [r1, #4]
	ldr r1, [r4, #0x60]
	movs r0, #0x14
	strh r0, [r1, #0xa]
	bl AnimSort
	ldr r0, [r4, #0x5c]
	ldrh r1, [r0, #2]
	subs r1, #0xc
_08077C26:
	strh r1, [r4, #0x32]
	ldrh r0, [r0, #2]
	subs r0, #0x10
	strh r0, [r4, #0x34]
	ldr r0, [r4, #0x60]
	strh r1, [r0, #2]
	ldr r4, _08077C5C @ =0x0201A790
	mov r0, sb
	adds r1, r4, #0
	bl sub_80D6394
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_805679C
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r6, #0
	bl sub_8056774
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077C5C: .4byte 0x0201A790

