	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8014760, 0x08014760 + 1
	.section .text.sub_8080394, "ax", %progbits
@ MapAnimBarrierfx_Loop @ JP 0x08080394 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MapAnimBarrierfx_Loop
	.thumb_func
MapAnimBarrierfx_Loop:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, _08080404 @ =0x02023CA8
	mov ip, r0
	ldr r0, [r6, #0x30]
	cmp r0, #0
	bge _080803A6
	adds r0, #7
_080803A6:
	asrs r0, r0, #3
	subs r7, r0, #2
	ldr r2, [r6, #0x34]
	cmp r2, #0
	bge _080803B2
	adds r2, #7
_080803B2:
	asrs r2, r2, #3
	subs r2, #9
	ldr r3, _08080408 @ =0x00004140
	movs r0, #4
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	ldr r0, _0808040C @ =0x08A20EEC
	str r0, [sp, #8]
	ldr r5, _08080410 @ =0x081F51FE
	adds r4, r6, #0
	adds r4, #0x48
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r5
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	mov r0, ip
	adds r1, r7, #0
	bl sub_8014760
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080803FA
	adds r0, r6, #0
	bl sub_8002DE4
_080803FA:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080404: .4byte 0x02023CA8
_08080408: .4byte 0x00004140
_0808040C: .4byte 0x08A20EEC
_08080410: .4byte 0x081F51FE

