	.syntax unified
	.set AsyncEkrDispUP, 0x08052888 + 1
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set CheckEkrWindowAppearUnexist, 0x08057CFC + 1
	.set EkrGauge_Set4C50, 0x08051EC4 + 1
	.set EnableEkrGauge, 0x08051F4C + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8085914, 0x08085914 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8053B9C, "ax", %progbits
@ sub_8053B9C @ JP 0x08053B9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8053B9C
	.thumb_func
sub_8053B9C:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl CheckEkrWindowAppearUnexist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08053BFA
	bl EnableEkrGauge
	bl AsyncEkrDispUP
	movs r0, #0
	str r0, [sp]
	ldr r1, _08053C04 @ =0x02022CA8
	ldr r2, _08053C08 @ =0x01000200
	mov r0, sp
	bl sub_80D636C
	ldr r0, _08053C0C @ =0x02000038
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	bl BG_EnableSyncByMask
	bl EkrGauge_Set4C50
	ldr r4, _08053C10 @ =0x0203E18C
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_8085914
	adds r0, r5, #0
	bl sub_8002DE4
_08053BFA:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053C04: .4byte 0x02022CA8
_08053C08: .4byte 0x01000200
_08053C0C: .4byte 0x02000038
_08053C10: .4byte 0x0203E18C

