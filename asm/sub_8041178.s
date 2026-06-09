	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.set GetItemMaxRange, 0x0801742C + 1
	.set GetItemMinRange, 0x08017414 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801B620, 0x0801B620 + 1
	.set sub_801B674, 0x0801B674 + 1
	.set sub_803C420, 0x0803C420 + 1
	.set sub_8041078, 0x08041078 + 1
	.section .text.sub_8041178, "ax", %progbits
@ sub_8041178 @ JP 0x08041178 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8041178
	.thumb_func
sub_8041178:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov sb, r0
	movs r4, #0
	movs r1, #0
	str r1, [sp, #0xc]
	movs r2, #0
	str r2, [sp, #0x10]
	movs r3, #0
	str r3, [sp, #0x14]
	str r1, [sp, #0x1c]
	str r2, [sp, #0x20]
	ldr r1, _080411B4 @ =0x0202BCEC
	ldrh r1, [r1, #0x10]
	cmp r1, #1
	bhi _080411BC
	ldr r0, _080411B8 @ =0x0203AA00
	adds r1, r0, #0
	adds r1, #0x86
	strb r3, [r1]
	adds r0, #0x87
	mov r4, sp
	ldrb r4, [r4, #0x14]
	strb r4, [r0]
	movs r0, #0
	b _08041338
	.align 2, 0
_080411B4: .4byte 0x0202BCEC
_080411B8: .4byte 0x0203AA00
_080411BC:
	movs r1, #0
	str r1, [sp, #8]
	b _080411C8
_080411C2:
	ldr r2, [sp, #8]
	adds r2, #1
	str r2, [sp, #8]
_080411C8:
	ldr r3, [sp, #8]
	cmp r3, #4
	bgt _080411EC
	ldr r1, _08041308 @ =0x03004DF0
	ldr r1, [r1]
	lsls r2, r3, #1
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	cmp r1, #0
	beq _080411EC
	adds r0, r1, #0
	bl GetItemIndex
	adds r1, r0, #0
	cmp r1, #0xa6
	bne _080411C2
	movs r4, #1
_080411EC:
	cmp r4, #0
	bne _080411F2
	b _08041338
_080411F2:
	ldr r0, _08041308 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_803C420
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_801B620
	ldr r0, _0804130C @ =0x0202E4D0
	movs r4, #2
	ldrsh r0, [r0, r4]
	subs r7, r0, #1
	cmp r7, #0
	blt _080412C8
_0804120E:
	ldr r0, _0804130C @ =0x0202E4D0
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	subs r2, r7, #1
	str r2, [sp, #0x24]
	cmp r6, #0
	blt _080412C2
	lsls r3, r7, #2
	mov r8, r3
	lsls r4, r7, #0x10
	mov sl, r4
_08041226:
	ldr r0, _08041310 @ =0x0202E4DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080412BC
	ldr r0, _08041314 @ =0x0202E4D4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r1, [r0]
	cmp r1, #0
	beq _0804124E
	ldr r0, _08041318 @ =0x0202BE40
	ldrb r0, [r0]
	cmp r1, r0
	bne _080412BC
_0804124E:
	ldr r0, _0804131C @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	movs r0, #0xa6
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #0xa6
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, sl
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl sub_801B674
	mov r3, sb
	ldrb r2, [r3, #2]
	mov r0, sp
	add r1, sp, #4
	bl sub_8041078
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp]
	ldr r4, [sp, #0x14]
	cmp r2, r4
	ble _0804129A
	str r2, [sp, #0x14]
_0804129A:
	mov r1, sb
	ldrb r1, [r1]
	cmp r2, r1
	blt _080412BC
	ldr r1, [sp, #4]
	mov r3, sb
	ldrb r3, [r3, #1]
	cmp r1, r3
	blt _080412BC
	ldr r4, [sp, #0x10]
	cmp r1, r4
	ble _080412BC
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	str r6, [sp, #0x1c]
	str r7, [sp, #0x20]
	str r0, [sp, #0x18]
_080412BC:
	subs r6, #1
	cmp r6, #0
	bge _08041226
_080412C2:
	ldr r7, [sp, #0x24]
	cmp r7, #0
	bge _0804120E
_080412C8:
	ldr r1, [sp, #0xc]
	mov r0, sb
	ldrb r0, [r0, #1]
	cmp r1, r0
	blt _08041324
	ldr r1, _08041320 @ =0x0203AA00
	adds r2, r1, #0
	adds r2, #0x86
	movs r0, #1
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x87
	mov r2, sp
	ldrb r2, [r2, #0x1c]
	strb r2, [r0]
	adds r0, #1
	add r3, sp, #0x20
	ldrb r3, [r3]
	strb r3, [r0]
	adds r0, #1
	mov r4, sp
	ldrb r4, [r4, #0x18]
	strb r4, [r0]
	adds r0, #1
	mov r2, sp
	ldrb r2, [r2, #8]
	strb r2, [r0]
	adds r0, #1
	mov r3, sp
	ldrb r3, [r3, #0x14]
	strb r3, [r0]
	b _08041336
	.align 2, 0
_08041308: .4byte 0x03004DF0
_0804130C: .4byte 0x0202E4D0
_08041310: .4byte 0x0202E4DC
_08041314: .4byte 0x0202E4D4
_08041318: .4byte 0x0202BE40
_0804131C: .4byte 0x0202E4E0
_08041320: .4byte 0x0203AA00
_08041324:
	ldr r0, _08041348 @ =0x0203AA00
	adds r2, r0, #0
	adds r2, #0x86
	movs r1, #0
	strb r1, [r2]
	adds r0, #0x87
	mov r4, sp
	ldrb r4, [r4, #0x14]
	strb r4, [r0]
_08041336:
	movs r0, #0
_08041338:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08041348: .4byte 0x0203AA00

