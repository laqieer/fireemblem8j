	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set Text_Skip, 0x08003D88 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8014328, 0x08014328 + 1
	.set sub_801729C, 0x0801729C + 1
	.section .text.sub_8011184, "ax", %progbits
@ sub_8011184 @ JP 0x08011184 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8011184
	.thumb_func
sub_8011184:
	push {r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	b _08011242
_08011190:
	ldrb r0, [r5]
	subs r0, #1
	cmp r0, #8
	bhi _08011240
	lsls r0, r0, #2
	ldr r1, _080111A4 @ =_080111A8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080111A4: .4byte _080111A8
_080111A8: @ jump table
	.4byte _08011238 @ case 0
	.4byte _08011220 @ case 1
	.4byte _0801120C @ case 2
	.4byte _080111F8 @ case 3
	.4byte _08011202 @ case 4
	.4byte _080111EE @ case 5
	.4byte _080111E4 @ case 6
	.4byte _080111E4 @ case 7
	.4byte _080111CC @ case 8
_080111CC:
	ldr r0, _080111E0 @ =0x030005F0
	ldr r0, [r0]
	mov r1, sp
	bl sub_8014328
	add r0, sp, #0x10
	mov r1, sp
	bl sub_8003F28
	b _08011240
	.align 2, 0
_080111E0: .4byte 0x030005F0
_080111E4:
	add r0, sp, #0x10
	movs r1, #0x10
	bl Text_Skip
	b _08011240
_080111EE:
	add r0, sp, #0x10
	ldr r1, [r5, #4]
	bl sub_8003D90
	b _08011240
_080111F8:
	add r4, sp, #0x10
	ldr r0, [r5, #4]
	bl sub_8009FA8
	b _0801122A
_08011202:
	add r0, sp, #0x10
	ldr r1, [r5, #4]
	bl sub_8003F28
	b _08011240
_0801120C:
	add r4, sp, #0x10
	ldr r0, _0801121C @ =0x030005E8
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_8009FA8
	b _0801122A
	.align 2, 0
_0801121C: .4byte 0x030005E8
_08011220:
	add r4, sp, #0x10
	ldr r0, _08011234 @ =0x030005EC
	ldrh r0, [r0]
	bl sub_801729C
_0801122A:
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	b _08011240
	.align 2, 0
_08011234: .4byte 0x030005EC
_08011238:
	add r0, sp, #0x10
	ldr r1, [r5, #4]
	bl Text_Skip
_08011240:
	adds r5, #8
_08011242:
	ldrb r0, [r5]
	cmp r0, #0
	bne _08011190
	movs r0, #3
	bl BG_EnableSyncByMask
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

