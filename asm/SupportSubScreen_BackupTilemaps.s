	.syntax unified
	.section .text.SupportSubScreen_BackupTilemaps, "ax", %progbits
@ SupportSubScreen_BackupTilemaps @ JP 0x080A58BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SupportSubScreen_BackupTilemaps
	.thumb_func
SupportSubScreen_BackupTilemaps:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	ldr r1, _080A5930 @ =0x020234A8
	mov sl, r1
	ldr r6, _080A5934 @ =0x02023CA8
	mov sb, r6
	ldr r7, _080A5938 @ =0x020136EC
	ldr r1, _080A593C @ =0x02022CA8
	mov r8, r1
	movs r6, #0x80
	lsls r6, r6, #4
	adds r6, r6, r7
	mov ip, r6
_080A58E0:
	adds r1, r0, #1
	str r1, [sp]
	lsls r0, r0, #1
	ldr r6, _080A5940 @ =0x020146EC
	adds r4, r0, r6
	adds r3, r0, r7
	adds r2, r0, #0
	movs r5, #0x13
_080A58F0:
	mov r1, r8
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r3]
	mov r6, ip
	adds r1, r2, r6
	mov r6, sl
	adds r0, r2, r6
	ldrh r0, [r0]
	strh r0, [r1]
	mov r1, sb
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #0x40
	adds r3, #0x40
	adds r2, #0x40
	subs r5, #1
	cmp r5, #0
	bge _080A58F0
	ldr r0, [sp]
	cmp r0, #0x1d
	ble _080A58E0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5930: .4byte 0x020234A8
_080A5934: .4byte 0x02023CA8
_080A5938: .4byte 0x020136EC
_080A593C: .4byte 0x02022CA8
_080A5940: .4byte 0x020146EC

