	.syntax unified
	.set EkrDemonkingObj_GetShakeOffset, 0x0807A1A4 + 1
	.set EkrDemonkingObj_SetBgOffset, 0x0807A1D8 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80139E0, 0x080139E0 + 1
	.section .text.sub_8079808, "ax", %progbits
@ sub_8079808 @ JP 0x08079808 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8079808
	.thumb_func
sub_8079808:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	mov r4, sp
	adds r4, #2
	movs r0, #0x2c
	ldrsh r2, [r5, r0]
	mov r0, sp
	adds r1, r4, #0
	movs r3, #0
	bl EkrDemonkingObj_GetShakeOffset
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl EkrDemonkingObj_SetBgOffset
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r0, #0xf0
	lsls r0, r0, #1
	cmp r1, r0
	bne _0807985A
	ldr r4, _0807987C @ =0x085C25A0
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #0xf0
	adds r3, r5, #0
	bl sub_80139E0
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0xf0
	adds r3, r5, #0
	bl sub_80139E0
_0807985A:
	ldr r0, _08079880 @ =0x08855D68
	bl Proc_Find
	cmp r0, #0
	bne _08079872
	movs r0, #0
	movs r1, #0
	bl EkrDemonkingObj_SetBgOffset
	adds r0, r5, #0
	bl sub_8002DE4
_08079872:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807987C: .4byte 0x085C25A0
_08079880: .4byte 0x08855D68

