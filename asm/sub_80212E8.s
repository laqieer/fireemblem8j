	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set __divsi3, 0x080D65F8 + 1
	.set j_TmCopyRect, 0x080DC0F4 + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8027144, 0x08027144 + 1
	.section .text.sub_80212E8, "ax", %progbits
@ sub_80212E8 @ JP 0x080212E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80212E8
	.thumb_func
sub_80212E8:
	push {r4, r5, r6, lr}
	sub sp, #0x34
	adds r6, r0, #0
	ldr r1, _08021324 @ =0x080DC7DC
	mov r0, sp
	movs r2, #0x34
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
	bne _08021328
	adds r0, r6, #0
	bl sub_8002DE4
	b _0802134E
	.align 2, 0
_08021324: .4byte 0x080DC7DC
_08021328:
	cmp r4, #0x18
	bne _08021334
	cmp r5, #9
	bne _08021334
	bl sub_8027144
_08021334:
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _08021358 @ =0x02003D2C
	adds r0, r0, r1
	ldr r1, _0802135C @ =0x02022CA8
	movs r2, #8
	movs r3, #9
	bl j_TmCopyRect
	movs r0, #1
	bl BG_EnableSyncByMask
_0802134E:
	add sp, #0x34
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021358: .4byte 0x02003D2C
_0802135C: .4byte 0x02022CA8

