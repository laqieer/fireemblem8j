	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set EkrDispUP_SetPositionSync, 0x08052854 + 1
	.set EkrGauge_Setxy323A, 0x08051F18 + 1
	.set sub_8056984, 0x08056984 + 1
	.section .text.sub_807A078, "ax", %progbits
@ sub_807A078 @ JP 0x0807A078 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807A078
	.thumb_func
sub_807A078:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r4, r0, #0
	adds r6, r1, #0
	lsls r4, r4, #0x10
	lsls r6, r6, #0x10
	asrs r5, r4, #0x10
	lsrs r4, r4, #0x10
	asrs r0, r6, #0x10
	mov sb, r0
	lsrs r6, r6, #0x10
	movs r0, #2
	adds r1, r4, #0
	adds r2, r6, #0
	bl BG_SetPosition
	ldr r1, _0807A144 @ =0x02000038
	mov r8, r1
	ldrh r1, [r1]
	adds r1, r5, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r0, r8
	ldrh r2, [r0, #2]
	add r2, sb
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	mov r1, r8
	ldrh r0, [r1]
	adds r0, r5, r0
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r1, #2]
	add r1, sb
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	mov r2, r8
	ldrh r0, [r2]
	adds r0, r5, r0
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r2, #2]
	add r1, sb
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	movs r0, #3
	adds r1, r4, #0
	adds r2, r6, #0
	bl BG_SetPosition
	ldr r6, _0807A148 @ =0x02000028
	ldrh r1, [r6]
	subs r1, r1, r5
	ldr r0, _0807A14C @ =0x0201FB0C
	ldr r4, [r0]
	subs r1, r1, r4
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r3, _0807A150 @ =0x0200002C
	ldrh r2, [r3]
	mov r0, sb
	subs r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrh r0, [r6, #2]
	adds r5, r5, r0
	subs r5, r5, r4
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldrh r4, [r3, #2]
	mov r0, sb
	subs r4, r4, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #0
	bl sub_8056984
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_8056984
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807A144: .4byte 0x02000038
_0807A148: .4byte 0x02000028
_0807A14C: .4byte 0x0201FB0C
_0807A150: .4byte 0x0200002C

