	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8054304, 0x08054304 + 1
	.set sub_8056984, 0x08056984 + 1
	.section .text.sub_8056AC0, "ax", %progbits
@ sub_8056AC0 @ JP 0x08056AC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056AC0
	.thumb_func
sub_8056AC0:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r2, _08056B10 @ =0x02000028
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r6, _08056B14 @ =0x0201FB0C
	ldr r0, [r6]
	subs r1, r1, r0
	ldr r3, _08056B18 @ =0x0200002C
	movs r5, #2
	ldrsh r4, [r2, r5]
	subs r4, r4, r0
	movs r0, #2
	ldrsh r5, [r3, r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	ldrsh r2, [r3, r0]
	movs r0, #0
	bl sub_8056984
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_8056984
	ldr r0, _08056B1C @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08056B20
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	b _08056B2E
	.align 2, 0
_08056B10: .4byte 0x02000028
_08056B14: .4byte 0x0201FB0C
_08056B18: .4byte 0x0200002C
_08056B1C: .4byte 0x0203E11C
_08056B20:
	cmp r0, #0
	blt _08056B2E
	cmp r0, #2
	bgt _08056B2E
	ldr r0, [r6]
	bl sub_8054304
_08056B2E:
	adds r0, r7, #0
	bl sub_8002DE4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

