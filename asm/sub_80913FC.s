	.syntax unified
	.set ClearAllTalkFlags, 0x0800699C + 1
	.set DoesStringContainTact, 0x08091874 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set SetCgTextFlags, 0x08090CAC + 1
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80044A4, 0x080044A4 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_800A004, 0x0800A004 + 1
	.section .text.sub_80913FC, "ax", %progbits
@ sub_80913FC @ JP 0x080913FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80913FC
	.thumb_func
sub_80913FC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sl, r0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r7, [sp, #0x30]
	ldr r5, [sp, #0x34]
	ldr r6, _08091450 @ =0x08A73E74
	adds r0, r6, #0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0809145E
	ldr r0, [sp, #0x2c]
	bl sub_8009FA8
	str r0, [r4, #0x2c]
	bl DoesStringContainTact
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809143A
	bl sub_800A004
	str r0, [r4, #0x2c]
_0809143A:
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _08091454
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _08091528
	.align 2, 0
_08091450: .4byte 0x08A73E74
_08091454:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _08091528
_0809145E:
	ldr r0, [sp, #0x38]
	cmp r0, #0
	beq _0809146E
	adds r0, r6, #0
	ldr r1, [sp, #0x38]
	bl Proc_StartBlocking
	b _08091476
_0809146E:
	adds r0, r6, #0
	movs r1, #3
	bl sub_8002BCC
_08091476:
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #7
	bl SetCgTextFlags
	bl ClearAllTalkFlags
	ldr r0, _08091538 @ =0x0203E828
	str r0, [r4, #0x30]
	adds r3, r4, #0
	adds r3, #0x57
	adds r6, r4, #0
	adds r6, #0x58
	movs r1, #0x5b
	adds r1, r1, r4
	mov ip, r1
	movs r1, #0x5c
	adds r1, r1, r4
	mov r8, r1
	movs r1, #0x50
	adds r1, r1, r4
	mov sb, r1
	adds r2, r4, #0
	adds r2, #0x34
	adds r0, #0x40
	adds r1, r4, #0
	adds r1, #0x48
_080914AC:
	str r0, [r1]
	subs r0, #8
	subs r1, #4
	cmp r1, r2
	bge _080914AC
	mov r0, sl
	strb r0, [r3]
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r6]
	mov r0, sp
	ldrb r1, [r0, #4]
	mov r0, ip
	strb r1, [r0]
	mov r0, sp
	ldrb r1, [r0, #8]
	mov r0, r8
	strb r1, [r0]
	str r7, [r4, #0x4c]
	cmp r5, #0
	bge _080914D8
	movs r5, #5
_080914D8:
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r5
	adds r5, r0, #0
	adds r5, #0x10
	cmp r7, #0
	bne _080914E8
	ldr r7, _0809153C @ =0x06013000
_080914E8:
	ldr r0, [r4, #0x30]
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_80044A4
	movs r0, #0
	bl SetTextFont
	ldr r0, _08091540 @ =0x085C7480
	lsls r1, r5, #5
	movs r2, #0x20
	bl sub_8000D68
	lsls r0, r7, #0x11
	lsrs r0, r0, #0x16
	ands r5, r6
	lsls r1, r5, #0xc
	adds r0, r0, r1
	mov r1, sb
	strh r0, [r1]
	ldr r0, [sp, #0x2c]
	bl sub_8009FA8
	str r0, [r4, #0x2c]
	bl DoesStringContainTact
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08091528
	bl sub_800A004
	str r0, [r4, #0x2c]
_08091528:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091538: .4byte 0x0203E828
_0809153C: .4byte 0x06013000
_08091540: .4byte 0x085C7480

