	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set __divsi3, 0x080D65F8 + 1
	.set j_TmCopyRect, 0x080DC0F4 + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8027144, 0x08027144 + 1
	.section .text.sub_8021B98, "ax", %progbits
@ sub_8021B98 @ JP 0x08021B98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8021B98
	.thumb_func
sub_8021B98:
	push {r4, r5, r6, lr}
	sub sp, #0x38
	adds r6, r0, #0
	ldr r1, _08021BD4 @ =0x080DC8B0
	mov r0, sp
	movs r2, #0x38
	bl memcpy
	adds r1, r6, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xe
	add r0, sp
	ldrb r4, [r0]
	ldrb r5, [r0, #1]
	cmp r4, #0xff
	bne _08021BD8
	adds r0, r6, #0
	bl sub_8002DE4
	b _08021BFE
	.align 2, 0
_08021BD4: .4byte 0x080DC8B0
_08021BD8:
	cmp r4, #0
	bne _08021BE4
	cmp r5, #0x10
	bne _08021BE4
	bl sub_8027144
_08021BE4:
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _08021C08 @ =0x02003D2C
	adds r0, r0, r1
	ldr r1, _08021C0C @ =0x02022CA8
	movs r2, #6
	movs r3, #8
	bl j_TmCopyRect
	movs r0, #1
	bl BG_EnableSyncByMask
_08021BFE:
	add sp, #0x38
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021C08: .4byte 0x02003D2C
_08021C0C: .4byte 0x02022CA8

