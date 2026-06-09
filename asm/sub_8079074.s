	.syntax unified
	.set EkrDemonkingObj_GetShakeOffset, 0x0807A1A4 + 1
	.set EkrDemonkingObj_SetBgOffset, 0x0807A1D8 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80720DC, 0x080720DC + 1
	.set sub_8078EF4, 0x08078EF4 + 1
	.set sub_807A078, 0x0807A078 + 1
	.section .text.sub_8079074, "ax", %progbits
@ sub_8079074 @ JP 0x08079074 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8079074
	.thumb_func
sub_8079074:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x4c]
	ldr r0, [r0, #0x5c]
	bl GetAnimAnotherSide
	movs r1, #0
	add r0, sp, #4
	strh r1, [r0]
	mov r5, sp
	adds r5, #6
	strh r1, [r5]
	ldr r0, [r6, #0x54]
	subs r0, #0x12
	cmp r0, #0x27
	bhi _080790CA
	adds r4, r6, #0
	adds r4, #0x64
	movs r0, #0
	ldrsh r2, [r4, r0]
	add r0, sp, #4
	adds r1, r5, #0
	movs r3, #1
	bl EkrDemonkingObj_GetShakeOffset
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl EkrDemonkingObj_SetBgOffset
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl sub_807A078
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_080790CA:
	add r3, sp, #4
	adds r2, r3, #0
	ldr r0, _080790FC @ =0x0201FB0C
	ldr r1, [r0]
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r3]
	adds r0, r2, #0
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	bl sub_80720DC
	ldr r3, [r6, #0x54]
	cmp r3, #0x1e
	ble _08079108
	ldr r1, _08079100 @ =0x03004F98
	movs r0, #0x38
	rsbs r0, r0, #0
	str r0, [r1]
	ldr r1, _08079104 @ =0x03004FA0
	movs r0, #0x10
	b _0807912C
	.align 2, 0
_080790FC: .4byte 0x0201FB0C
_08079100: .4byte 0x03004F98
_08079104: .4byte 0x03004FA0
_08079108:
	movs r2, #0x38
	rsbs r2, r2, #0
	movs r4, #0x1e
	str r4, [sp]
	movs r0, #5
	movs r1, #0
	bl sub_8012E84
	ldr r1, _08079164 @ =0x03004F98
	str r0, [r1]
	ldr r3, [r6, #0x54]
	str r4, [sp]
	movs r0, #5
	movs r1, #0
	movs r2, #0x10
	bl sub_8012E84
	ldr r1, _08079168 @ =0x03004FA0
_0807912C:
	str r0, [r1]
	ldr r2, _0807916C @ =0x02000028
	ldr r0, [r6, #0x58]
	ldr r1, _08079164 @ =0x03004F98
	ldr r1, [r1]
	adds r0, r0, r1
	strh r0, [r2]
	ldr r2, _08079170 @ =0x0200002C
	ldr r0, [r6, #0x5c]
	ldr r1, _08079168 @ =0x03004FA0
	ldr r1, [r1]
	adds r0, r0, r1
	strh r0, [r2]
	ldr r0, [r6, #0x4c]
	bl sub_8078EF4
	ldr r0, [r6, #0x54]
	cmp r0, #0x31
	ble _08079174
	movs r0, #0
	str r0, [r6, #0x54]
	movs r1, #0
	bl EkrDemonkingObj_SetBgOffset
	adds r0, r6, #0
	bl sub_8002DE4
	b _08079178
	.align 2, 0
_08079164: .4byte 0x03004F98
_08079168: .4byte 0x03004FA0
_0807916C: .4byte 0x02000028
_08079170: .4byte 0x0200002C
_08079174:
	adds r0, #1
	str r0, [r6, #0x54]
_08079178:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

