	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8038FF0, 0x08038FF0 + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_8039094, "ax", %progbits
@ sub_8039094 @ JP 0x08039094 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8039094
	.thumb_func
sub_8039094:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	ldr r0, [r0, #0x2c]
	lsls r0, r0, #6
	ldr r1, _08039130 @ =0x020038C8
	adds r0, r0, r1
	bl sub_8038FF0
	ldr r1, _08039134 @ =0x02003BE8
	movs r2, #0
	movs r0, #2
	strh r0, [r1]
	ldr r0, _08039138 @ =0x02003B88
	str r0, [r1, #4]
	ldr r3, _0803913C @ =0x02003BA8
	str r3, [r1, #8]
	str r2, [r1, #0xc]
	str r2, [r1, #0x10]
	ldr r2, _08039140 @ =0x085C6CF0
	ldr r0, _08039144 @ =0x085C6CFC
	movs r4, #6
	mov r8, r4
	mov r4, r8
	strh r4, [r1, #2]
	movs r7, #0
	adds r6, r0, #0
	adds r5, r3, #0
_080390D2:
	lsls r4, r7, #1
	ldrh r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #5
	str r2, [sp]
	bl sub_80D6378
	ldr r1, _08039138 @ =0x02003B88
	adds r4, r4, r1
	strh r0, [r4]
	ldr r0, [r6]
	lsls r0, r0, #4
	str r0, [r5]
	ldr r0, [r6, #4]
	lsls r0, r0, #4
	str r0, [r5, #4]
	adds r6, #8
	adds r5, #8
	ldr r2, [sp]
	adds r2, #2
	adds r7, #1
	cmp r7, r8
	blt _080390D2
	movs r0, #0
	mov r1, sb
	str r0, [r1, #0x34]
	ldr r0, _08039148 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08039120
	movs r0, #0x80
	bl m4aSongNumStart
_08039120:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039130: .4byte 0x020038C8
_08039134: .4byte 0x02003BE8
_08039138: .4byte 0x02003B88
_0803913C: .4byte 0x02003BA8
_08039140: .4byte 0x085C6CF0
_08039144: .4byte 0x085C6CFC
_08039148: .4byte 0x0202BCEC

