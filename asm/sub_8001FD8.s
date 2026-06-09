	.syntax unified
	.set ClearTileRigistry, 0x08001F30 + 1
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_8001FD8, "ax", %progbits
@ sub_8001FD8 @ JP 0x08001FD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8001FD8
	.thumb_func
sub_8001FD8:
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _08001FE4 @ =0x02024CDC
	movs r5, #0
	b _08002034
	.align 2, 0
_08001FE4: .4byte 0x02024CDC
_08001FE8:
	ldrh r0, [r4, #0xa]
	cmp r0, #1
	beq _0800200C
	cmp r0, #1
	bgt _08001FF8
	cmp r0, #0
	beq _08001FFE
	b _08002030
_08001FF8:
	cmp r0, #2
	beq _0800201A
	b _08002030
_08001FFE:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldrh r2, [r4, #8]
	lsrs r2, r2, #1
	bl sub_80D6370
	b _08002030
_0800200C:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldrh r2, [r4, #8]
	lsrs r2, r2, #2
	bl sub_80D636C
	b _08002030
_0800201A:
	ldr r0, [r4]
	str r0, [sp]
	ldr r1, [r4, #4]
	ldrh r2, [r4, #8]
	lsrs r2, r2, #2
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl sub_80D636C
_08002030:
	adds r4, #0xc
	adds r5, #1
_08002034:
	ldr r0, _08002048 @ =0x02024CD4
	ldr r0, [r0]
	cmp r5, r0
	blt _08001FE8
	bl ClearTileRigistry
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002048: .4byte 0x02024CD4

