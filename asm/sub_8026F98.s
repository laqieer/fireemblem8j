	.syntax unified
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8026F98, "ax", %progbits
@ sub_8026F98 @ JP 0x08026F98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8026F98
	.thumb_func
sub_8026F98:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_8000CD8
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	movs r2, #0
	cmp r0, #0
	bne _08026FB2
	ldr r2, _08026FFC @ =0x0203400C
_08026FB2:
	cmp r0, #0x20
	bne _08026FB8
	ldr r2, _08027000 @ =0x0203600C
_08026FB8:
	cmp r0, #0x24
	bne _08026FBE
	ldr r2, _08027004 @ =0x0203800C
_08026FBE:
	cmp r1, #0x44
	bne _08026FC4
	ldr r2, _08027000 @ =0x0203600C
_08026FC4:
	cmp r2, #0
	beq _08026FF4
	ldr r1, _08027008 @ =0x085C3B4C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #5
	adds r1, r5, #0
	adds r1, #0x20
	adds r5, r0, r1
	adds r4, r0, r2
	movs r6, #3
_08026FDC:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x10
	bl sub_80D636C
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	adds r4, r4, r0
	subs r6, #1
	cmp r6, #0
	bge _08026FDC
_08026FF4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08026FFC: .4byte 0x0203400C
_08027000: .4byte 0x0203600C
_08027004: .4byte 0x0203800C
_08027008: .4byte 0x085C3B4C

