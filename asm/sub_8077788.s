	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_8077788, "ax", %progbits
@ NewEkrTriPegasusKnightOBJ @ JP 0x08077788 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewEkrTriPegasusKnightOBJ
	.thumb_func
NewEkrTriPegasusKnightOBJ:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r0, _080777BC @ =0x087A9B38
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r7, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	cmp r4, #0
	bne _080777C8
	movs r0, #0x12
	strh r0, [r5, #0x2e]
	ldr r0, _080777C0 @ =0x0203E198
	ldr r6, [r0]
	ldr r3, _080777C4 @ =0x087AA068
	b _080777D2
	.align 2, 0
_080777BC: .4byte 0x087A9B38
_080777C0: .4byte 0x0203E198
_080777C4: .4byte 0x087AA068
_080777C8:
	movs r0, #0x11
	strh r0, [r5, #0x2e]
	ldr r0, _0807781C @ =0x0203E198
	ldr r6, [r0, #4]
	ldr r3, _08077820 @ =0x087AA39C
_080777D2:
	str r3, [sp]
	adds r0, r7, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r5, #0x60]
	ldr r4, _08077824 @ =0x0201A790
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80D6394
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _08077828 @ =0x080E8F58
	mov r1, r8
	cmp r1, #0
	beq _08077804
	ldr r0, _0807782C @ =0x080EA2DC
	mov r1, sb
	cmp r1, #0
	bne _08077804
	ldr r0, _08077830 @ =0x080E9910
_08077804:
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807781C: .4byte 0x0203E198
_08077820: .4byte 0x087AA39C
_08077824: .4byte 0x0201A790
_08077828: .4byte 0x080E8F58
_0807782C: .4byte 0x080EA2DC
_08077830: .4byte 0x080E9910

