	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.set GetUnitAffinityIcon, 0x08028650 + 1
	.set GetUnitAid, 0x080186CC + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set SortUnitList_GetUnitSoloAnimation, 0x08094EC4 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.set sub_8018EC4, 0x08018EC4 + 1
	.set sub_8018EE4, 0x08018EE4 + 1
	.set sub_8018F24, 0x08018F24 + 1
	.set sub_8018F64, 0x08018F64 + 1
	.set sub_8018F84, 0x08018F84 + 1
	.set sub_8018FAC, 0x08018FAC + 1
	.section .text.SortUnitList, "ax", %progbits
@ SortUnitList @ JP 0x08094ED0-0x080972D4 - region-different, gbadisasm descriptive asm (merged run, D24)
	.thumb
	.global SortUnitList
	.thumb_func
SortUnitList:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x60
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #1
	ands r2, r1
	subs r0, #1
	cmp r0, #0x1f
	bls _08094EF2
	bl _080972C0
_08094EF2:
	lsls r0, r0, #2
	ldr r1, _08094EFC @ =_08094F00
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08094EFC: .4byte _08094F00
_08094F00: @ jump table
	.4byte _08094F80 @ case 0
	.4byte _08095270 @ case 1
	.4byte _08095164 @ case 2
	.4byte _08095374 @ case 3
	.4byte _08095470 @ case 4
	.4byte _0809557C @ case 5
	.4byte _08095688 @ case 6
	.4byte _08095794 @ case 7
	.4byte _080958A0 @ case 8
	.4byte _080959AC @ case 9
	.4byte _08095AB8 @ case 10
	.4byte _08095BC4 @ case 11
	.4byte _08095F38 @ case 12
	.4byte _08096044 @ case 13
	.4byte _08096248 @ case 14
	.4byte _0809633C @ case 15
	.4byte _08096430 @ case 16
	.4byte _08096524 @ case 17
	.4byte _08095CD0 @ case 18
	.4byte _08095E2C @ case 19
	.4byte _08096654 @ case 20
	.4byte _08096760 @ case 21
	.4byte _080968E8 @ case 22
	.4byte _080969EC @ case 23
	.4byte _08096AE8 @ case 24
	.4byte _08096BE4 @ case 25
	.4byte _08096CE0 @ case 26
	.4byte _08096DDC @ case 27
	.4byte _08096ED8 @ case 28
	.4byte _08096FD4 @ case 29
	.4byte _080970D0 @ case 30
	.4byte _080971BC @ case 31
_08094F80:
	cmp r2, #0
	bne _08095074
	movs r0, #0
	str r0, [sp, #0x40]
	movs r1, #0
	ldr r3, _0809506C @ =0x0200F158
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _08094FF6
	adds r7, r3, #0
	mov sl, r7
_08094F9A:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _08094FE6
	ldr r7, _08095070 @ =0x0200D6E0
	mov sb, r7
_08094FAE:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	ldr r2, [r0]
	lsls r0, r3, #2
	adds r4, r0, r1
	ldr r3, [r4]
	ldr r0, [r3]
	ldr r1, [r0]
	ldrb r0, [r2, #0xa]
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	bhs _08094FD6
	str r5, [r4]
	str r3, [r6]
	movs r2, #1
	str r2, [sp, #0x40]
_08094FD6:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _08094FAE
_08094FE6:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	mov r3, ip
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08094F9A
_08094FF6:
	movs r1, #0
	ldr r7, _0809506C @ =0x0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _08095066
	mov sl, r7
_08095004:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _08095056
	ldr r7, _08095070 @ =0x0200D6E0
	mov sb, r7
	movs r7, #2
	mov ip, r8
_0809501C:
	adds r6, r3, #1
	lsls r0, r6, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	ands r1, r7
	lsls r0, r3, #2
	mov r2, sb
	adds r3, r0, r2
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	ands r0, r7
	cmp r1, r0
	bhs _08095046
	str r4, [r3]
	str r2, [r5]
	movs r3, #1
	str r3, [sp, #0x40]
_08095046:
	lsls r0, r6, #0x18
	lsrs r3, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r2, ip
	subs r0, r0, r2
	cmp r3, r0
	blt _0809501C
_08095056:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	ldr r7, _0809506C @ =0x0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _08095004
_08095066:
	ldr r0, [sp, #0x40]
	bl _080968D2
	.align 2, 0
_0809506C: .4byte 0x0200F158
_08095070: .4byte 0x0200D6E0
_08095074:
	movs r1, #0
	str r1, [sp, #0x44]
	ldr r2, _0809515C @ =0x0200F158
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	adds r3, r1, #0
	cmp r3, r0
	bge _080950E6
	adds r7, r2, #0
	mov sl, r7
_0809508A:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _080950D6
	ldr r7, _08095160 @ =0x0200D6E0
	mov sb, r7
_0809509E:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	ldr r2, [r0]
	lsls r0, r3, #2
	adds r4, r0, r1
	ldr r3, [r4]
	ldr r0, [r3]
	ldr r1, [r0]
	ldrb r0, [r2, #0xa]
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	bls _080950C6
	str r5, [r4]
	str r3, [r6]
	movs r2, #1
	str r2, [sp, #0x44]
_080950C6:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _0809509E
_080950D6:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	mov r3, ip
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0809508A
_080950E6:
	movs r1, #0
	ldr r7, _0809515C @ =0x0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _08095156
	mov sl, r7
_080950F4:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _08095146
	ldr r7, _08095160 @ =0x0200D6E0
	mov sb, r7
	movs r7, #2
	mov ip, r8
_0809510C:
	adds r6, r3, #1
	lsls r0, r6, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	ands r1, r7
	lsls r0, r3, #2
	mov r2, sb
	adds r3, r0, r2
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	ands r0, r7
	cmp r1, r0
	bls _08095136
	str r4, [r3]
	str r2, [r5]
	movs r3, #1
	str r3, [sp, #0x44]
_08095136:
	lsls r0, r6, #0x18
	lsrs r3, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r2, ip
	subs r0, r0, r2
	cmp r3, r0
	blt _0809510C
_08095146:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	ldr r7, _0809515C @ =0x0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _080950F4
_08095156:
	ldr r0, [sp, #0x44]
	bl _080968D2
	.align 2, 0
_0809515C: .4byte 0x0200F158
_08095160: .4byte 0x0200D6E0
_08095164:
	cmp r2, #0
	bne _080951EC
	movs r1, #0
	mov sl, r1
	ldr r3, _080951E4 @ =0x0200F158
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0809517C
	bl _080971A8
_0809517C:
	adds r7, r3, #0
	mov sb, r7
_08095180:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _080951D0
	ldr r0, _080951E8 @ =0x0200D6E0
	mov r8, r0
_08095194:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #8]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	ble _080951C2
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_080951C2:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08095194
_080951D0:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08095180
	bl _080971A8
	.align 2, 0
_080951E4: .4byte 0x0200F158
_080951E8: .4byte 0x0200D6E0
_080951EC:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08095268 @ =0x0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08095202
	bl _080971A8
_08095202:
	ldr r2, _08095268 @ =0x0200F158
	mov sb, r2
_08095206:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08095256
	ldr r0, _0809526C @ =0x0200D6E0
	mov r8, r0
_0809521A:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #8]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _08095248
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08095248:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _0809521A
_08095256:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08095206
	bl _080971A8
	.align 2, 0
_08095268: .4byte 0x0200F158
_0809526C: .4byte 0x0200D6E0
_08095270:
	cmp r2, #0
	bne _080952F4
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r3, _080952EC @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _08095288
	bl _0809663C
_08095288:
	adds r7, r3, #0
	mov sl, r7
_0809528C:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _080952D8
	ldr r7, _080952F0 @ =0x0200D6E0
	mov sb, r7
_080952A0:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	ldr r2, [r0, #4]
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	ldrb r0, [r2, #0xa]
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	bhs _080952C8
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_080952C8:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _080952A0
_080952D8:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _080952EC @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0809528C
	bl _0809663C
	.align 2, 0
_080952EC: .4byte 0x0200F158
_080952F0: .4byte 0x0200D6E0
_080952F4:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _0809536C @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	blt _08095308
	bl _0809663C
_08095308:
	adds r3, r2, #0
	mov sl, r3
_0809530C:
	movs r3, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _08095358
	ldr r0, _08095370 @ =0x0200D6E0
	mov sb, r0
_08095320:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	ldr r2, [r0, #4]
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	ldrb r0, [r2, #0xa]
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	bls _08095348
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_08095348:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _08095320
_08095358:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0809536C @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0809530C
	bl _0809663C
	.align 2, 0
_0809536C: .4byte 0x0200F158
_08095370: .4byte 0x0200D6E0
_08095374:
	cmp r2, #0
	bne _080953F4
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, _080953EC @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0809538C
	bl _0809663C
_0809538C:
	adds r7, r3, #0
	mov sl, r7
_08095390:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _080953D8
	ldr r7, _080953F0 @ =0x0200D6E0
	mov sb, r7
_080953A4:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r2, [r5]
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r1, [r4]
	ldrb r0, [r2, #9]
	ldrb r1, [r1, #9]
	cmp r0, r1
	bls _080953C8
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_080953C8:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _080953A4
_080953D8:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _080953EC @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08095390
	bl _0809663C
	.align 2, 0
_080953EC: .4byte 0x0200F158
_080953F0: .4byte 0x0200D6E0
_080953F4:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _08095468 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	blt _08095408
	bl _0809663C
_08095408:
	adds r3, r2, #0
	mov sl, r3
_0809540C:
	movs r3, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _08095454
	ldr r0, _0809546C @ =0x0200D6E0
	mov sb, r0
_08095420:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r2, [r5]
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r1, [r4]
	ldrb r0, [r2, #9]
	ldrb r1, [r1, #9]
	cmp r0, r1
	bhs _08095444
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_08095444:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _08095420
_08095454:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08095468 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0809540C
	bl _0809663C
	.align 2, 0
_08095468: .4byte 0x0200F158
_0809546C: .4byte 0x0200D6E0
_08095470:
	cmp r2, #0
	bne _080954F8
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _080954F0 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _08095488
	bl _080971A8
_08095488:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _080954DA
	ldr r1, _080954F4 @ =0x0200D6E0
	mov sb, r1
_0809549A:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8018E64
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8018E64
	cmp r4, r0
	ble _080954CA
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r0, #1
	mov sl, r0
_080954CA:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080954F0 @ =0x0200F158
	ldrb r0, [r0]
	mov r1, r8
	subs r0, r0, r1
	cmp r5, r0
	blt _0809549A
_080954DA:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _080954F0 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08095488
	bl _080971A8
	.align 2, 0
_080954F0: .4byte 0x0200F158
_080954F4: .4byte 0x0200D6E0
_080954F8:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _08095574 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0809550C
	bl _080972AE
_0809550C:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _0809555E
	ldr r0, _08095578 @ =0x0200D6E0
	mov sb, r0
_0809551E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8018E64
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8018E64
	cmp r4, r0
	bge _0809554E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0809554E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08095574 @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _0809551E
_0809555E:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08095574 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0809550C
	bl _080972AE
	.align 2, 0
_08095574: .4byte 0x0200F158
_08095578: .4byte 0x0200D6E0
_0809557C:
	cmp r2, #0
	bne _08095604
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _080955FC @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _08095594
	bl _080972AE
_08095594:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _080955E6
	ldr r7, _08095600 @ =0x0200D6E0
	mov sb, r7
_080955A6:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8018EA4
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8018EA4
	cmp r4, r0
	ble _080955D6
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_080955D6:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080955FC @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _080955A6
_080955E6:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _080955FC @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08095594
	bl _080972AE
	.align 2, 0
_080955FC: .4byte 0x0200F158
_08095600: .4byte 0x0200D6E0
_08095604:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _08095680 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08095618
	bl _080972AE
_08095618:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _0809566A
	ldr r7, _08095684 @ =0x0200D6E0
	mov sb, r7
_0809562A:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8018EA4
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8018EA4
	cmp r4, r0
	bge _0809565A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0809565A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08095680 @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _0809562A
_0809566A:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08095680 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08095618
	bl _080972AE
	.align 2, 0
_08095680: .4byte 0x0200F158
_08095684: .4byte 0x0200D6E0
_08095688:
	cmp r2, #0
	bne _08095710
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _08095708 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080956A0
	bl _080972AE
_080956A0:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _080956F2
	ldr r7, _0809570C @ =0x0200D6E0
	mov sb, r7
_080956B2:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8018EC4
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8018EC4
	cmp r4, r0
	ble _080956E2
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_080956E2:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08095708 @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _080956B2
_080956F2:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08095708 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080956A0
	bl _080972AE
	.align 2, 0
_08095708: .4byte 0x0200F158
_0809570C: .4byte 0x0200D6E0
_08095710:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _0809578C @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08095724
	bl _080972AE
_08095724:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08095776
	ldr r7, _08095790 @ =0x0200D6E0
	mov sb, r7
_08095736:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8018EC4
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8018EC4
	cmp r4, r0
	bge _08095766
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08095766:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0809578C @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08095736
_08095776:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0809578C @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08095724
	bl _080972AE
	.align 2, 0
_0809578C: .4byte 0x0200F158
_08095790: .4byte 0x0200D6E0
_08095794:
	cmp r2, #0
	bne _0809581C
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _08095814 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080957AC
	bl _080972AE
_080957AC:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _080957FE
	ldr r7, _08095818 @ =0x0200D6E0
	mov sb, r7
_080957BE:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8018EE4
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8018EE4
	cmp r4, r0
	ble _080957EE
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_080957EE:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08095814 @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _080957BE
_080957FE:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08095814 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080957AC
	bl _080972AE
	.align 2, 0
_08095814: .4byte 0x0200F158
_08095818: .4byte 0x0200D6E0
_0809581C:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _08095898 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08095830
	bl _080972AE
_08095830:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08095882
	ldr r7, _0809589C @ =0x0200D6E0
	mov sb, r7
_08095842:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8018EE4
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8018EE4
	cmp r4, r0
	bge _08095872
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08095872:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08095898 @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08095842
_08095882:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08095898 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08095830
	bl _080972AE
	.align 2, 0
_08095898: .4byte 0x0200F158
_0809589C: .4byte 0x0200D6E0
_080958A0:
	cmp r2, #0
	bne _08095928
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _08095920 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080958B8
	bl _080972AE
_080958B8:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _0809590A
	ldr r7, _08095924 @ =0x0200D6E0
	mov sb, r7
_080958CA:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8018F24
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8018F24
	cmp r4, r0
	ble _080958FA
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_080958FA:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08095920 @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _080958CA
_0809590A:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08095920 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080958B8
	bl _080972AE
	.align 2, 0
_08095920: .4byte 0x0200F158
_08095924: .4byte 0x0200D6E0
_08095928:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _080959A4 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0809593C
	bl _080972AE
_0809593C:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _0809598E
	ldr r7, _080959A8 @ =0x0200D6E0
	mov sb, r7
_0809594E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8018F24
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8018F24
	cmp r4, r0
	bge _0809597E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0809597E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080959A4 @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _0809594E
_0809598E:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080959A4 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0809593C
	bl _080972AE
	.align 2, 0
_080959A4: .4byte 0x0200F158
_080959A8: .4byte 0x0200D6E0
_080959AC:
	cmp r2, #0
	bne _08095A34
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _08095A2C @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080959C4
	bl _080972AE
_080959C4:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08095A16
	ldr r7, _08095A30 @ =0x0200D6E0
	mov sb, r7
_080959D6:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8018FAC
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8018FAC
	cmp r4, r0
	ble _08095A06
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08095A06:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08095A2C @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _080959D6
_08095A16:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08095A2C @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080959C4
	bl _080972AE
	.align 2, 0
_08095A2C: .4byte 0x0200F158
_08095A30: .4byte 0x0200D6E0
_08095A34:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _08095AB0 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08095A48
	bl _080972AE
_08095A48:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08095A9A
	ldr r7, _08095AB4 @ =0x0200D6E0
	mov sb, r7
_08095A5A:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8018FAC
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8018FAC
	cmp r4, r0
	bge _08095A8A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08095A8A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08095AB0 @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08095A5A
_08095A9A:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08095AB0 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08095A48
	bl _080972AE
	.align 2, 0
_08095AB0: .4byte 0x0200F158
_08095AB4: .4byte 0x0200D6E0
_08095AB8:
	cmp r2, #0
	bne _08095B40
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _08095B38 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _08095AD0
	bl _080972AE
_08095AD0:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08095B22
	ldr r7, _08095B3C @ =0x0200D6E0
	mov sb, r7
_08095AE2:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8018F64
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8018F64
	cmp r4, r0
	ble _08095B12
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08095B12:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08095B38 @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08095AE2
_08095B22:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08095B38 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08095AD0
	bl _080972AE
	.align 2, 0
_08095B38: .4byte 0x0200F158
_08095B3C: .4byte 0x0200D6E0
_08095B40:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _08095BBC @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08095B54
	bl _080972AE
_08095B54:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08095BA6
	ldr r7, _08095BC0 @ =0x0200D6E0
	mov sb, r7
_08095B66:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8018F64
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8018F64
	cmp r4, r0
	bge _08095B96
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08095B96:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08095BBC @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08095B66
_08095BA6:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08095BBC @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08095B54
	bl _080972AE
	.align 2, 0
_08095BBC: .4byte 0x0200F158
_08095BC0: .4byte 0x0200D6E0
_08095BC4:
	cmp r2, #0
	bne _08095C4C
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _08095C44 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _08095BDC
	bl _080972AE
_08095BDC:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08095C2E
	ldr r7, _08095C48 @ =0x0200D6E0
	mov sb, r7
_08095BEE:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8018F84
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8018F84
	cmp r4, r0
	ble _08095C1E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08095C1E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08095C44 @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08095BEE
_08095C2E:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08095C44 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08095BDC
	bl _080972AE
	.align 2, 0
_08095C44: .4byte 0x0200F158
_08095C48: .4byte 0x0200D6E0
_08095C4C:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _08095CC8 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08095C60
	bl _080972AE
_08095C60:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08095CB2
	ldr r7, _08095CCC @ =0x0200D6E0
	mov sb, r7
_08095C72:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8018F84
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8018F84
	cmp r4, r0
	bge _08095CA2
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08095CA2:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08095CC8 @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08095C72
_08095CB2:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08095CC8 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08095C60
	bl _080972AE
	.align 2, 0
_08095CC8: .4byte 0x0200F158
_08095CCC: .4byte 0x0200D6E0
_08095CD0:
	cmp r2, #0
	bne _08095D80
	movs r3, #0
	str r3, [sp, #0x48]
	movs r1, #0
	ldr r7, _08095D78 @ =0x0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r2, r0
	bge _08095D70
	adds r0, r7, #0
	mov sl, r0
_08095CE8:
	movs r2, #0
	mov r3, sl
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov sb, r1
	cmp r2, r0
	bge _08095D60
	ldr r7, _08095D7C @ =0x0200D6E0
	mov ip, r7
_08095CFC:
	adds r0, r2, #1
	mov r8, r0
	lsls r0, r0, #2
	mov r1, ip
	adds r7, r0, r1
	ldr r6, [r7]
	ldr r1, [r6]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r3, r3, r0
	lsls r0, r2, #2
	mov r2, ip
	adds r4, r0, r2
	ldr r5, [r4]
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	cmp r3, r0
	ble _08095D4E
	str r6, [r4]
	str r5, [r7]
	movs r3, #1
	str r3, [sp, #0x48]
_08095D4E:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, sb
	subs r0, r0, r3
	cmp r2, r0
	blt _08095CFC
_08095D60:
	mov r7, sb
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08095D78 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08095CE8
_08095D70:
	ldr r3, [sp, #0x48]
	bl _080971AA
	.align 2, 0
_08095D78: .4byte 0x0200F158
_08095D7C: .4byte 0x0200D6E0
_08095D80:
	movs r7, #0
	str r7, [sp, #0x4c]
	movs r1, #0
	ldr r2, _08095E24 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r7, r0
	bge _08095E1C
	adds r3, r2, #0
	mov sl, r3
_08095D94:
	movs r2, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov sb, r1
	cmp r2, r0
	bge _08095E0C
	ldr r0, _08095E28 @ =0x0200D6E0
	mov ip, r0
_08095DA8:
	adds r1, r2, #1
	mov r8, r1
	lsls r0, r1, #2
	mov r3, ip
	adds r7, r0, r3
	ldr r6, [r7]
	ldr r1, [r6]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r3, r3, r0
	lsls r0, r2, #2
	mov r1, ip
	adds r4, r0, r1
	ldr r5, [r4]
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	cmp r3, r0
	bge _08095DFA
	str r6, [r4]
	str r5, [r7]
	movs r2, #1
	str r2, [sp, #0x4c]
_08095DFA:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r2, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, sb
	subs r0, r0, r1
	cmp r2, r0
	blt _08095DA8
_08095E0C:
	mov r2, sb
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08095E24 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08095D94
_08095E1C:
	ldr r7, [sp, #0x4c]
	bl _0809663E
	.align 2, 0
_08095E24: .4byte 0x0200F158
_08095E28: .4byte 0x0200D6E0
_08095E2C:
	cmp r2, #0
	bne _08095EB4
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _08095EAC @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _08095E44
	bl _080971A8
_08095E44:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08095E96
	ldr r1, _08095EB0 @ =0x0200D6E0
	mov sb, r1
_08095E56:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAid
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAid
	cmp r4, r0
	ble _08095E86
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r0, #1
	mov sl, r0
_08095E86:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08095EAC @ =0x0200F158
	ldrb r0, [r0]
	mov r1, r8
	subs r0, r0, r1
	cmp r5, r0
	blt _08095E56
_08095E96:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08095EAC @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08095E44
	bl _080971A8
	.align 2, 0
_08095EAC: .4byte 0x0200F158
_08095EB0: .4byte 0x0200D6E0
_08095EB4:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _08095F30 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08095EC8
	bl _080972AE
_08095EC8:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08095F1A
	ldr r0, _08095F34 @ =0x0200D6E0
	mov sb, r0
_08095EDA:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAid
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAid
	cmp r4, r0
	bge _08095F0A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08095F0A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08095F30 @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08095EDA
_08095F1A:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08095F30 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08095EC8
	bl _080972AE
	.align 2, 0
_08095F30: .4byte 0x0200F158
_08095F34: .4byte 0x0200D6E0
_08095F38:
	cmp r2, #0
	bne _08095FC0
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _08095FB8 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _08095F50
	bl _080972AE
_08095F50:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08095FA2
	ldr r7, _08095FBC @ =0x0200D6E0
	mov sb, r7
_08095F62:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	cmp r4, r0
	bge _08095F92
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08095F92:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08095FB8 @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08095F62
_08095FA2:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08095FB8 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08095F50
	bl _080972AE
	.align 2, 0
_08095FB8: .4byte 0x0200F158
_08095FBC: .4byte 0x0200D6E0
_08095FC0:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _0809603C @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08095FD4
	bl _080972AE
_08095FD4:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08096026
	ldr r7, _08096040 @ =0x0200D6E0
	mov sb, r7
_08095FE6:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	cmp r4, r0
	ble _08096016
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08096016:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0809603C @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08095FE6
_08096026:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0809603C @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08095FD4
	bl _080972AE
	.align 2, 0
_0809603C: .4byte 0x0200F158
_08096040: .4byte 0x0200D6E0
_08096044:
	cmp r2, #0
	beq _0809604A
	b _0809614C
_0809604A:
	movs r3, #0
	str r3, [sp, #0x50]
	movs r4, #0
	ldr r0, _08096088 @ =0x0200F158
	ldrb r0, [r0]
	cmp r2, r0
	bhs _08096082
	ldr r5, _0809608C @ =0x0200D6E0
_0809605A:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	mov r7, sp
	adds r1, r7, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08096088 @ =0x0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blo _0809605A
_08096082:
	movs r4, #0
	b _08096136
	.align 2, 0
_08096088: .4byte 0x0200F158
_0809608C: .4byte 0x0200D6E0
_08096090:
	movs r6, #0
	ldrb r0, [r1]
	adds r1, r4, #1
	subs r0, r0, r1
	str r1, [sp, #0x58]
	cmp r6, r0
	bge _08096130
	ldr r0, _080960D8 @ =0x0200D6E0
	mov sl, r0
_080960A2:
	adds r0, r6, #1
	mov r1, sp
	adds r1, r1, r0
	mov r8, r1
	mov r2, sp
	adds r5, r2, r6
	ldrb r4, [r1]
	adds r3, r4, #0
	ldrb r2, [r5]
	mov sb, r0
	cmp r3, r2
	bls _080960DC
	adds r1, r2, #0
	strb r4, [r5]
	mov r3, r8
	strb r1, [r3]
	lsls r2, r6, #2
	add r2, sl
	ldr r3, [r2]
	lsls r1, r0, #2
	add r1, sl
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r7, #1
	str r7, [sp, #0x50]
	b _0809611E
	.align 2, 0
_080960D8: .4byte 0x0200D6E0
_080960DC:
	cmp r3, r2
	bne _0809611E
	mov r1, sb
	lsls r0, r1, #2
	mov r2, sl
	adds r7, r0, r2
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r0, r6, #2
	mov r3, sl
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bls _0809611E
	ldrb r1, [r5]
	mov r2, r8
	ldrb r0, [r2]
	strb r0, [r5]
	strb r1, [r2]
	ldr r3, [r6]
	ldr r0, [r7]
	str r0, [r6]
	str r3, [r7]
	movs r3, #1
	str r3, [sp, #0x50]
_0809611E:
	mov r7, sb
	lsls r0, r7, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _08096148 @ =0x0200F158
	ldrb r0, [r0]
	ldr r1, [sp, #0x58]
	subs r0, r0, r1
	cmp r6, r0
	blt _080960A2
_08096130:
	ldr r2, [sp, #0x58]
	lsls r0, r2, #0x18
	lsrs r4, r0, #0x18
_08096136:
	ldr r1, _08096148 @ =0x0200F158
	ldrb r0, [r1]
	subs r0, #1
	cmp r4, r0
	blt _08096090
	ldr r3, [sp, #0x50]
	bl _080971AA
	.align 2, 0
_08096148: .4byte 0x0200F158
_0809614C:
	movs r7, #0
	str r7, [sp, #0x54]
	movs r4, #0
	ldr r0, _08096188 @ =0x0200F158
	ldrb r0, [r0]
	cmp r7, r0
	bhs _08096184
	ldr r5, _0809618C @ =0x0200D6E0
_0809615C:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	mov r2, sp
	adds r1, r2, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08096188 @ =0x0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blo _0809615C
_08096184:
	movs r4, #0
	b _08096236
	.align 2, 0
_08096188: .4byte 0x0200F158
_0809618C: .4byte 0x0200D6E0
_08096190:
	movs r6, #0
	ldrb r0, [r1]
	adds r1, r4, #1
	subs r0, r0, r1
	str r1, [sp, #0x5c]
	cmp r6, r0
	bge _08096230
	ldr r3, _080961D8 @ =0x0200D6E0
	mov sl, r3
_080961A2:
	adds r0, r6, #1
	mov r7, sp
	adds r7, r7, r0
	mov r8, r7
	mov r1, sp
	adds r5, r1, r6
	ldrb r4, [r7]
	adds r3, r4, #0
	ldrb r2, [r5]
	mov sb, r0
	cmp r3, r2
	bhs _080961DC
	adds r1, r2, #0
	strb r4, [r5]
	strb r1, [r7]
	lsls r2, r6, #2
	add r2, sl
	ldr r3, [r2]
	lsls r1, r0, #2
	add r1, sl
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r2, #1
	str r2, [sp, #0x54]
	b _0809621E
	.align 2, 0
_080961D8: .4byte 0x0200D6E0
_080961DC:
	cmp r3, r2
	bne _0809621E
	mov r3, sb
	lsls r0, r3, #2
	mov r1, sl
	adds r7, r0, r1
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r0, r6, #2
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bhs _0809621E
	ldrb r1, [r5]
	mov r3, r8
	ldrb r0, [r3]
	strb r0, [r5]
	strb r1, [r3]
	ldr r3, [r6]
	ldr r0, [r7]
	str r0, [r6]
	str r3, [r7]
	movs r7, #1
	str r7, [sp, #0x54]
_0809621E:
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _08096244 @ =0x0200F158
	ldrb r0, [r0]
	ldr r2, [sp, #0x5c]
	subs r0, r0, r2
	cmp r6, r0
	blt _080961A2
_08096230:
	ldr r3, [sp, #0x5c]
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
_08096236:
	ldr r1, _08096244 @ =0x0200F158
	ldrb r0, [r1]
	subs r0, #1
	cmp r4, r0
	blt _08096190
	ldr r7, [sp, #0x54]
	b _0809663E
	.align 2, 0
_08096244: .4byte 0x0200F158
_08096248:
	cmp r2, #0
	bne _080962C4
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, _080962BC @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _080962B6
	adds r7, r3, #0
	mov sl, r7
_08096260:
	movs r2, #0
	mov r3, sl
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov sb, r1
	cmp r2, r0
	bge _080962A6
	mov r8, sb
_08096272:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _080962C0 @ =0x0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #4
	ldrsh r1, [r4, r0]
	movs r7, #4
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _08096296
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_08096296:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt _08096272
_080962A6:
	mov r7, sb
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080962BC @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08096260
_080962B6:
	mov r3, ip
	bl _080971AA
	.align 2, 0
_080962BC: .4byte 0x0200F158
_080962C0: .4byte 0x0200D6E0
_080962C4:
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r2, _08096334 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _0809632E
	adds r3, r2, #0
	mov sl, r3
_080962D8:
	movs r2, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov sb, r1
	cmp r2, r0
	bge _0809631E
	mov r8, sb
_080962EA:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r1, _08096338 @ =0x0200D6E0
	adds r5, r0, r1
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r1
	ldr r3, [r2]
	movs r7, #4
	ldrsh r1, [r4, r7]
	movs r7, #4
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _0809630E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0809630E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt _080962EA
_0809631E:
	mov r7, sb
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08096334 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _080962D8
_0809632E:
	mov r3, ip
	bl _080971AA
	.align 2, 0
_08096334: .4byte 0x0200F158
_08096338: .4byte 0x0200D6E0
_0809633C:
	cmp r2, #0
	bne _080963B8
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r3, _080963B0 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _080963AA
	adds r7, r3, #0
	mov sl, r7
_08096354:
	movs r2, #0
	mov r3, sl
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov sb, r1
	cmp r2, r0
	bge _0809639A
	mov r8, sb
_08096366:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _080963B4 @ =0x0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #6
	ldrsh r1, [r4, r0]
	movs r7, #6
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _0809638A
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0809638A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt _08096366
_0809639A:
	mov r7, sb
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080963B0 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08096354
_080963AA:
	mov r3, ip
	bl _080971AA
	.align 2, 0
_080963B0: .4byte 0x0200F158
_080963B4: .4byte 0x0200D6E0
_080963B8:
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r2, _08096428 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _08096422
	adds r3, r2, #0
	mov sl, r3
_080963CC:
	movs r2, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov sb, r1
	cmp r2, r0
	bge _08096412
	mov r8, sb
_080963DE:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r1, _0809642C @ =0x0200D6E0
	adds r5, r0, r1
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r1
	ldr r3, [r2]
	movs r7, #6
	ldrsh r1, [r4, r7]
	movs r7, #6
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _08096402
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_08096402:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt _080963DE
_08096412:
	mov r7, sb
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08096428 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _080963CC
_08096422:
	mov r3, ip
	bl _080971AA
	.align 2, 0
_08096428: .4byte 0x0200F158
_0809642C: .4byte 0x0200D6E0
_08096430:
	cmp r2, #0
	bne _080964AC
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r3, _080964A4 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0809649E
	adds r7, r3, #0
	mov sl, r7
_08096448:
	movs r2, #0
	mov r3, sl
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov sb, r1
	cmp r2, r0
	bge _0809648E
	mov r8, sb
_0809645A:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _080964A8 @ =0x0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #8
	ldrsh r1, [r4, r0]
	movs r7, #8
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _0809647E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0809647E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt _0809645A
_0809648E:
	mov r7, sb
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080964A4 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08096448
_0809649E:
	mov r3, ip
	bl _080971AA
	.align 2, 0
_080964A4: .4byte 0x0200F158
_080964A8: .4byte 0x0200D6E0
_080964AC:
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r2, _0809651C @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _08096516
	adds r3, r2, #0
	mov sl, r3
_080964C0:
	movs r2, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov sb, r1
	cmp r2, r0
	bge _08096506
	mov r8, sb
_080964D2:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r1, _08096520 @ =0x0200D6E0
	adds r5, r0, r1
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r1
	ldr r3, [r2]
	movs r7, #8
	ldrsh r1, [r4, r7]
	movs r7, #8
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _080964F6
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_080964F6:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt _080964D2
_08096506:
	mov r7, sb
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0809651C @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _080964C0
_08096516:
	mov r3, ip
	bl _080971AA
	.align 2, 0
_0809651C: .4byte 0x0200F158
_08096520: .4byte 0x0200D6E0
_08096524:
	cmp r2, #0
	bne _080965B8
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r3, _080965B0 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0809653A
	b _0809663C
_0809653A:
	adds r7, r3, #0
	mov sl, r7
_0809653E:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _0809659E
	ldr r7, _080965B4 @ =0x0200D6E0
	mov sb, r7
_08096552:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	ble _0809658E
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_0809658E:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _08096552
_0809659E:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _080965B0 @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0809653E
	b _0809663C
	.align 2, 0
_080965B0: .4byte 0x0200F158
_080965B4: .4byte 0x0200D6E0
_080965B8:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _0809664C @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _0809663C
	adds r3, r2, #0
	mov sl, r3
_080965CC:
	movs r3, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _0809662C
	ldr r0, _08096650 @ =0x0200D6E0
	mov sb, r0
_080965E0:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	bge _0809661C
_08096614:
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_0809661C:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _080965E0
_0809662C:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0809664C @ =0x0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080965CC
_0809663C:
	mov r7, ip
_0809663E:
	cmp r7, #0
	bne _08096646
	bl _080972C0
_08096646:
	movs r0, #1
	bl _080972C2
	.align 2, 0
_0809664C: .4byte 0x0200F158
_08096650: .4byte 0x0200D6E0
_08096654:
	cmp r2, #0
	bne _080966DC
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _080966D4 @ =0x0200F158
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0809666E
	bl _080971A8
_0809666E:
	adds r7, r3, #0
	mov sb, r7
_08096672:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _080966C2
	ldr r0, _080966D8 @ =0x0200D6E0
	mov r8, r0
_08096686:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r1, [r0]
	lsls r1, r1, #0x1c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	cmp r1, r0
	bls _080966B4
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_080966B4:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08096686
_080966C2:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08096672
	bl _080971A8
	.align 2, 0
_080966D4: .4byte 0x0200F158
_080966D8: .4byte 0x0200D6E0
_080966DC:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08096758 @ =0x0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _080966F2
	bl _080971A8
_080966F2:
	ldr r2, _08096758 @ =0x0200F158
	mov sb, r2
_080966F6:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08096746
	ldr r0, _0809675C @ =0x0200D6E0
	mov r8, r0
_0809670A:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r1, [r0]
	lsls r1, r1, #0x1c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	cmp r1, r0
	bhs _08096738
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08096738:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _0809670A
_08096746:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _080966F6
	bl _080971A8
	.align 2, 0
_08096758: .4byte 0x0200F158
_0809675C: .4byte 0x0200D6E0
_08096760:
	cmp r2, #0
	bne _08096820
	movs r7, #0
	mov sb, r7
	movs r1, #0
	ldr r0, _08096790 @ =0x0200F158
	ldrb r3, [r0]
	cmp r2, r3
	bhs _080967A8
	ldr r6, _08096794 @ =0x0200D6E0
	movs r5, #0x10
	movs r4, #1
_08096778:
	lsls r0, r1, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ands r2, r5
	cmp r2, #0
	beq _08096798
	mov r2, sp
	adds r0, r2, r1
	strb r4, [r0]
	b _0809679E
	.align 2, 0
_08096790: .4byte 0x0200F158
_08096794: .4byte 0x0200D6E0
_08096798:
	mov r7, sp
	adds r0, r7, r1
	strb r2, [r0]
_0809679E:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r3
	blo _08096778
_080967A8:
	movs r1, #0
	ldr r2, _08096818 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _080967B6
	b _080968D0
_080967B6:
	mov r8, r2
	ldr r3, _0809681C @ =0x0200D6E0
	mov ip, r3
	mov sl, r8
_080967BE:
	movs r2, #0
	mov r7, r8
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	adds r6, r1, #0
	cmp r2, r0
	bge _08096808
	mov r7, ip
_080967D0:
	adds r5, r2, #1
	mov r0, sp
	adds r4, r0, r5
	adds r1, r0, r2
	ldrb r3, [r4]
	ldrb r0, [r1]
	cmp r3, r0
	bls _080967FA
	ldrb r0, [r1]
	strb r3, [r1]
	strb r0, [r4]
	lsls r2, r2, #2
	adds r2, r2, r7
	ldr r3, [r2]
	lsls r1, r5, #2
	adds r1, r1, r7
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r1, #1
	mov sb, r1
_080967FA:
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	mov r3, r8
	ldrb r0, [r3]
	subs r0, r0, r6
	cmp r2, r0
	blt _080967D0
_08096808:
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _080967BE
	b _080968D0
	.align 2, 0
_08096818: .4byte 0x0200F158
_0809681C: .4byte 0x0200D6E0
_08096820:
	movs r1, #0
	mov sb, r1
	ldr r0, _0809684C @ =0x0200F158
	ldrb r2, [r0]
	cmp sb, r2
	bhs _08096864
	ldr r6, _08096850 @ =0x0200D6E0
	adds r3, r2, #0
	movs r5, #0x10
	movs r4, #1
_08096834:
	lsls r0, r1, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ands r2, r5
	cmp r2, #0
	beq _08096854
	mov r2, sp
	adds r0, r2, r1
	strb r4, [r0]
	b _0809685A
	.align 2, 0
_0809684C: .4byte 0x0200F158
_08096850: .4byte 0x0200D6E0
_08096854:
	mov r7, sp
	adds r0, r7, r1
	strb r2, [r0]
_0809685A:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r3
	blo _08096834
_08096864:
	movs r1, #0
	ldr r2, _080968E0 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	bge _080968D0
	mov r8, r2
	ldr r3, _080968E4 @ =0x0200D6E0
	mov ip, r3
	mov sl, r8
_08096878:
	movs r2, #0
	mov r7, r8
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	adds r6, r1, #0
	cmp r2, r0
	bge _080968C2
	mov r7, ip
_0809688A:
	adds r5, r2, #1
	mov r0, sp
	adds r4, r0, r5
	adds r1, r0, r2
	ldrb r3, [r4]
	ldrb r0, [r1]
	cmp r3, r0
	bhs _080968B4
	ldrb r0, [r1]
	strb r3, [r1]
	strb r0, [r4]
	lsls r2, r2, #2
	adds r2, r2, r7
	ldr r3, [r2]
	lsls r1, r5, #2
_080968A8:
	adds r1, r1, r7
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r1, #1
	mov sb, r1
_080968B4:
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	mov r3, r8
	ldrb r0, [r3]
	subs r0, r0, r6
	cmp r2, r0
	blt _0809688A
_080968C2:
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _08096878
_080968D0:
	mov r0, sb
_080968D2:
	cmp r0, #0
	bne _080968DA
	bl _080972C0
_080968DA:
	movs r0, #1
	bl _080972C2
	.align 2, 0
_080968E0: .4byte 0x0200F158
_080968E4: .4byte 0x0200D6E0
_080968E8:
	cmp r2, #0
	bne _0809696C
	movs r1, #0
	mov sl, r1
	ldr r3, _08096964 @ =0x0200F158
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _08096900
	bl _080971A8
_08096900:
	adds r7, r3, #0
	mov sb, r7
_08096904:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08096950
	ldr r0, _08096968 @ =0x0200D6E0
	mov r8, r0
_08096918:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x28
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x28
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08096942
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08096942:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08096918
_08096950:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08096904
	bl _080971A8
	.align 2, 0
_08096964: .4byte 0x0200F158
_08096968: .4byte 0x0200D6E0
_0809696C:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _080969E4 @ =0x0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08096982
	bl _080971A8
_08096982:
	ldr r2, _080969E4 @ =0x0200F158
	mov sb, r2
_08096986:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _080969D2
	ldr r0, _080969E8 @ =0x0200D6E0
	mov r8, r0
_0809699A:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x28
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x28
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _080969C4
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_080969C4:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _0809699A
_080969D2:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08096986
	bl _080971A8
	.align 2, 0
_080969E4: .4byte 0x0200F158
_080969E8: .4byte 0x0200D6E0
_080969EC:
	cmp r2, #0
	bne _08096A6C
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08096A64 @ =0x0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _08096A04
	b _080971A8
_08096A04:
	ldr r2, _08096A64 @ =0x0200F158
	mov sb, r2
_08096A08:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08096A54
	ldr r0, _08096A68 @ =0x0200D6E0
	mov r8, r0
_08096A1C:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x29
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x29
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08096A46
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08096A46:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08096A1C
_08096A54:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08096A08
	b _080971A8
	.align 2, 0
_08096A64: .4byte 0x0200F158
_08096A68: .4byte 0x0200D6E0
_08096A6C:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08096AE0 @ =0x0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08096A80
	b _080971A8
_08096A80:
	ldr r2, _08096AE0 @ =0x0200F158
	mov sb, r2
_08096A84:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08096AD0
	ldr r0, _08096AE4 @ =0x0200D6E0
	mov r8, r0
_08096A98:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x29
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x29
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _08096AC2
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08096AC2:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08096A98
_08096AD0:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08096A84
	b _080971A8
	.align 2, 0
_08096AE0: .4byte 0x0200F158
_08096AE4: .4byte 0x0200D6E0
_08096AE8:
	cmp r2, #0
	bne _08096B68
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08096B60 @ =0x0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _08096B00
	b _080971A8
_08096B00:
	ldr r2, _08096B60 @ =0x0200F158
	mov sb, r2
_08096B04:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08096B50
	ldr r0, _08096B64 @ =0x0200D6E0
	mov r8, r0
_08096B18:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2a
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]

_08096B30:
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08096B42
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08096B42:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08096B18
_08096B50:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08096B04
	b _080971A8
	.align 2, 0
_08096B60: .4byte 0x0200F158
_08096B64: .4byte 0x0200D6E0
_08096B68:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08096BDC @ =0x0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08096B7C
	b _080971A8
_08096B7C:
	ldr r2, _08096BDC @ =0x0200F158
	mov sb, r2
_08096B80:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08096BCC
	ldr r0, _08096BE0 @ =0x0200D6E0
	mov r8, r0
_08096B94:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2a
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _08096BBE
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08096BBE:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08096B94
_08096BCC:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08096B80
	b _080971A8
	.align 2, 0
_08096BDC: .4byte 0x0200F158
_08096BE0: .4byte 0x0200D6E0
_08096BE4:
	cmp r2, #0
	bne _08096C64
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08096C5C @ =0x0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _08096BFC
	b _080971A8
_08096BFC:
	ldr r2, _08096C5C @ =0x0200F158
	mov sb, r2
_08096C00:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08096C4C
	ldr r0, _08096C60 @ =0x0200D6E0
	mov r8, r0
_08096C14:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2b
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2b
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08096C3E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08096C3E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08096C14
_08096C4C:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08096C00
	b _080971A8
	.align 2, 0
_08096C5C: .4byte 0x0200F158
_08096C60: .4byte 0x0200D6E0
_08096C64:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08096CD8 @ =0x0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08096C78
	b _080971A8
_08096C78:
	ldr r2, _08096CD8 @ =0x0200F158
	mov sb, r2
_08096C7C:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08096CC8
	ldr r0, _08096CDC @ =0x0200D6E0
	mov r8, r0
_08096C90:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2b
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2b
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _08096CBA
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08096CBA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08096C90
_08096CC8:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08096C7C
	b _080971A8
	.align 2, 0
_08096CD8: .4byte 0x0200F158
_08096CDC: .4byte 0x0200D6E0
_08096CE0:
	cmp r2, #0
	bne _08096D60
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08096D58 @ =0x0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _08096CF8
	b _080971A8
_08096CF8:
	ldr r2, _08096D58 @ =0x0200F158
	mov sb, r2
_08096CFC:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08096D48
	ldr r0, _08096D5C @ =0x0200D6E0
	mov r8, r0
_08096D10:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08096D3A
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08096D3A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08096D10
_08096D48:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08096CFC
	b _080971A8
	.align 2, 0
_08096D58: .4byte 0x0200F158
_08096D5C: .4byte 0x0200D6E0
_08096D60:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08096DD4 @ =0x0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08096D74
	b _080971A8
_08096D74:
	ldr r2, _08096DD4 @ =0x0200F158
	mov sb, r2
_08096D78:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08096DC4
	ldr r0, _08096DD8 @ =0x0200D6E0
	mov r8, r0
_08096D8C:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _08096DB6
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08096DB6:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08096D8C
_08096DC4:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08096D78
	b _080971A8
	.align 2, 0
_08096DD4: .4byte 0x0200F158
_08096DD8: .4byte 0x0200D6E0
_08096DDC:
	cmp r2, #0
	bne _08096E5C
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08096E54 @ =0x0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _08096DF4
	b _080971A8
_08096DF4:
	ldr r2, _08096E54 @ =0x0200F158
	mov sb, r2
_08096DF8:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08096E44
	ldr r0, _08096E58 @ =0x0200D6E0
	mov r8, r0
_08096E0C:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2d
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2d
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08096E36
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08096E36:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08096E0C
_08096E44:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08096DF8
	b _080971A8
	.align 2, 0
_08096E54: .4byte 0x0200F158
_08096E58: .4byte 0x0200D6E0
_08096E5C:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08096ED0 @ =0x0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08096E70
	b _080971A8
_08096E70:
	ldr r2, _08096ED0 @ =0x0200F158
	mov sb, r2
_08096E74:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08096EC0
	ldr r0, _08096ED4 @ =0x0200D6E0
	mov r8, r0
_08096E88:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2d
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2d
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _08096EB2
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08096EB2:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08096E88
_08096EC0:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08096E74
	b _080971A8
	.align 2, 0
_08096ED0: .4byte 0x0200F158
_08096ED4: .4byte 0x0200D6E0
_08096ED8:
	cmp r2, #0
	bne _08096F58
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08096F50 @ =0x0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _08096EF0
	b _080971A8
_08096EF0:
	ldr r2, _08096F50 @ =0x0200F158
	mov sb, r2
_08096EF4:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08096F40
	ldr r0, _08096F54 @ =0x0200D6E0
	mov r8, r0
_08096F08:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2e
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2e
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08096F32
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08096F32:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08096F08
_08096F40:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08096EF4
	b _080971A8
	.align 2, 0
_08096F50: .4byte 0x0200F158
_08096F54: .4byte 0x0200D6E0
_08096F58:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08096FCC @ =0x0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08096F6C
	b _080971A8
_08096F6C:
	ldr r2, _08096FCC @ =0x0200F158
	mov sb, r2
_08096F70:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08096FBC
	ldr r0, _08096FD0 @ =0x0200D6E0
	mov r8, r0
_08096F84:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2e
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2e
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _08096FAE
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08096FAE:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08096F84
_08096FBC:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08096F70
	b _080971A8
	.align 2, 0
_08096FCC: .4byte 0x0200F158
_08096FD0: .4byte 0x0200D6E0
_08096FD4:
	cmp r2, #0
	bne _08097054
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _0809704C @ =0x0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _08096FEC
	b _080971A8
_08096FEC:
	ldr r2, _0809704C @ =0x0200F158
	mov sb, r2
_08096FF0:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _0809703C
	ldr r0, _08097050 @ =0x0200D6E0
	mov r8, r0
_08097004:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2f
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2f
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0809702E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_0809702E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08097004
_0809703C:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08096FF0
	b _080971A8
	.align 2, 0
_0809704C: .4byte 0x0200F158
_08097050: .4byte 0x0200D6E0
_08097054:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _080970C8 @ =0x0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08097068
	b _080971A8
_08097068:
	ldr r2, _080970C8 @ =0x0200F158
	mov sb, r2
_0809706C:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _080970B8
	ldr r0, _080970CC @ =0x0200D6E0
	mov r8, r0
_08097080:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2f
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2f
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _080970AA
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_080970AA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sb
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08097080
_080970B8:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0809706C
	b _080971A8
	.align 2, 0
_080970C8: .4byte 0x0200F158
_080970CC: .4byte 0x0200D6E0
_080970D0:
	cmp r2, #0
	bne _08097144
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _0809713C @ =0x0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bge _080971A8
	ldr r2, _0809713C @ =0x0200F158
	mov sb, r2
_080970EA:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r2, r0
	bge _08097128
_080970FA:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _08097140 @ =0x0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	ldrb r0, [r4, #0xa]
	ldrb r7, [r3, #0xa]
	cmp r0, r7
	bls _0809711A
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_0809711A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r3, sb
	ldrb r0, [r3]
	subs r0, r0, r1
	cmp r2, r0
	blt _080970FA
_08097128:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _080970EA
	b _080971A8
	.align 2, 0
_0809713C: .4byte 0x0200F158
_08097140: .4byte 0x0200D6E0
_08097144:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _080971B4 @ =0x0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	bge _080971A8
	ldr r2, _080971B4 @ =0x0200F158
	mov sb, r2
_0809715A:
	movs r2, #0
	mov r3, sb
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r2, r0
	bge _08097198
_0809716A:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _080971B8 @ =0x0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	ldrb r0, [r4, #0xa]
	ldrb r7, [r3, #0xa]
	cmp r0, r7
	bhs _0809718A
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_0809718A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r3, sb
	ldrb r0, [r3]
	subs r0, r0, r1
	cmp r2, r0
	blt _0809716A
_08097198:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0809715A
_080971A8:
	mov r3, sl
_080971AA:
	cmp r3, #0
	bne _080971B0
	b _080972C0
_080971B0:
	movs r0, #1
	b _080972C2
	.align 2, 0
_080971B4: .4byte 0x0200F158
_080971B8: .4byte 0x0200D6E0
_080971BC:
	cmp r2, #0
	bne _0809723C
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _08097234 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	bge _080972AE
_080971D0:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08097222
	ldr r0, _08097238 @ =0x0200D6E0
	mov sb, r0
_080971E2:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl SortUnitList_GetUnitSoloAnimation
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl SortUnitList_GetUnitSoloAnimation
	cmp r4, r0
	ble _08097212
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08097212:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08097234 @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _080971E2
_08097222:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08097234 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _080971D0
	b _080972AE
	.align 2, 0
_08097234: .4byte 0x0200F158
_08097238: .4byte 0x0200D6E0
_0809723C:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _080972B8 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	bge _080972AE
_0809724C:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _0809729E
	ldr r7, _080972BC @ =0x0200D6E0
	mov sb, r7
_0809725E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl SortUnitList_GetUnitSoloAnimation
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl SortUnitList_GetUnitSoloAnimation
	cmp r4, r0
	bge _0809728E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0809728E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080972B8 @ =0x0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _0809725E
_0809729E:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080972B8 @ =0x0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0809724C
_080972AE:
	mov r2, sl
	cmp r2, #0
	beq _080972C0
	movs r0, #1
	b _080972C2
	.align 2, 0
_080972B8: .4byte 0x0200F158
_080972BC: .4byte 0x0200D6E0
_080972C0:
	movs r0, #0
_080972C2:
	add sp, #0x60
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

