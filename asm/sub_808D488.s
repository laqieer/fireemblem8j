	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_80040B8, 0x080040B8 + 1
	.set sub_8007BD4, 0x08007BD4 + 1
	.set sub_8030BE4, 0x08030BE4 + 1
	.set sub_808C834, 0x0808C834 + 1
	.set sub_808CDEC, 0x0808CDEC + 1
	.set sub_808CEA8, 0x0808CEA8 + 1
	.set sub_808D3E4, 0x0808D3E4 + 1
	.set sub_808D408, 0x0808D408 + 1
	.set sub_808D42C, 0x0808D42C + 1
	.set sub_80923CC, 0x080923CC + 1
	.section .text.sub_808D488, "ax", %progbits
@ sub_808D488 @ JP 0x0808D488 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BoxDialogueInterpreter_Main
	.thumb_func
BoxDialogueInterpreter_Main:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r6, r0, #0
	adds r0, #0x4e
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	ldr r0, _0808D4BC @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _0808D510
	bl sub_808C834
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	bne _0808D510
	movs r3, #0x80
	mov r8, r3
	b _0808D52A
	.align 2, 0
_0808D4BC: .4byte 0x085775CC
_0808D4C0:
	bl sub_808D3E4
	ldr r0, _0808D4E0 @ =0x08A73798
	bl Proc_Find
	movs r1, #1
	bl Proc_Goto
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0808D4E4 @ =0x08A738D0
	bl Proc_EndEach
	b _0808D7D0
	.align 2, 0
_0808D4E0: .4byte 0x08A73798
_0808D4E4: .4byte 0x08A738D0
_0808D4E8:
	adds r0, r1, #1
	str r0, [r6, #0x2c]
	b _0808DA82
_0808D4EE:
	adds r1, r6, #0
	adds r1, #0x58
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _0808DA82
_0808D500:
	adds r0, r6, #0
	bl sub_8002DE4
	b _0808DA82
_0808D508:
	adds r0, r6, #0
	bl sub_808D42C
	b _0808DA82
_0808D510:
	adds r1, r6, #0
	adds r1, #0x4a
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0808D522
	b _0808DA88
_0808D522:
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r0, [r0]
	strh r0, [r1]
_0808D52A:
	bl sub_808D408
	ldr r0, [r6, #0x30]
	bl SetTextFont
	movs r7, #0
	cmp r7, r8
	blt _0808D53C
	b _0808DA82
_0808D53C:
	ldr r0, [r6, #0x2c]
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0x80
	bls _0808D548
	b _0808D9B8
_0808D548:
	lsls r0, r1, #2
	ldr r1, _0808D554 @ =_0808D558
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808D554: .4byte _0808D558
_0808D558: @ jump table
	.4byte _0808D87C @ case 0
	.4byte _0808D882 @ case 1
	.4byte _0808D8FA @ case 2
	.4byte _0808D974 @ case 3
	.4byte _0808D8AA @ case 4
	.4byte _0808D8BE @ case 5
	.4byte _0808D8D2 @ case 6
	.4byte _0808D8E6 @ case 7
	.4byte _0808D9B8 @ case 8
	.4byte _0808D9B8 @ case 9
	.4byte _0808D9B8 @ case 10
	.4byte _0808D9B8 @ case 11
	.4byte _0808D9B8 @ case 12
	.4byte _0808D9B8 @ case 13
	.4byte _0808D9B8 @ case 14
	.4byte _0808D9B8 @ case 15
	.4byte _0808D9B8 @ case 16
	.4byte _0808D9B8 @ case 17
	.4byte _0808D80E @ case 18
	.4byte _0808D80E @ case 19
	.4byte _0808D80E @ case 20
	.4byte _0808D9B8 @ case 21
	.4byte _0808D9B8 @ case 22
	.4byte _0808D9B8 @ case 23
	.4byte _0808D75C @ case 24
	.4byte _0808D798 @ case 25
	.4byte _0808D9B8 @ case 26
	.4byte _0808D9B8 @ case 27
	.4byte _0808D9B8 @ case 28
	.4byte _0808D9B8 @ case 29
	.4byte _0808D9B8 @ case 30
	.4byte _0808D9B8 @ case 31
	.4byte _0808D9B8 @ case 32
	.4byte _0808D9B8 @ case 33
	.4byte _0808D9B8 @ case 34
	.4byte _0808D9B8 @ case 35
	.4byte _0808D9B8 @ case 36
	.4byte _0808D9B8 @ case 37
	.4byte _0808D9B8 @ case 38
	.4byte _0808D9B8 @ case 39
	.4byte _0808D9B8 @ case 40
	.4byte _0808D9B8 @ case 41
	.4byte _0808D9B8 @ case 42
	.4byte _0808D9B8 @ case 43
	.4byte _0808D9B8 @ case 44
	.4byte _0808D9B8 @ case 45
	.4byte _0808D9B8 @ case 46
	.4byte _0808D9B8 @ case 47
	.4byte _0808D9B8 @ case 48
	.4byte _0808D9B8 @ case 49
	.4byte _0808D9B8 @ case 50
	.4byte _0808D9B8 @ case 51
	.4byte _0808D9B8 @ case 52
	.4byte _0808D9B8 @ case 53
	.4byte _0808D9B8 @ case 54
	.4byte _0808D9B8 @ case 55
	.4byte _0808D9B8 @ case 56
	.4byte _0808D9B8 @ case 57
	.4byte _0808D9B8 @ case 58
	.4byte _0808D9B8 @ case 59
	.4byte _0808D9B8 @ case 60
	.4byte _0808D9B8 @ case 61
	.4byte _0808D9B8 @ case 62
	.4byte _0808D9B8 @ case 63
	.4byte _0808D9B8 @ case 64
	.4byte _0808D9B8 @ case 65
	.4byte _0808D9B8 @ case 66
	.4byte _0808D9B8 @ case 67
	.4byte _0808D9B8 @ case 68
	.4byte _0808D9B8 @ case 69
	.4byte _0808D9B8 @ case 70
	.4byte _0808D9B8 @ case 71
	.4byte _0808D9B8 @ case 72
	.4byte _0808D9B8 @ case 73
	.4byte _0808D9B8 @ case 74
	.4byte _0808D9B8 @ case 75
	.4byte _0808D9B8 @ case 76
	.4byte _0808D9B8 @ case 77
	.4byte _0808D9B8 @ case 78
	.4byte _0808D9B8 @ case 79
	.4byte _0808D9B8 @ case 80
	.4byte _0808D9B8 @ case 81
	.4byte _0808D9B8 @ case 82
	.4byte _0808D9B8 @ case 83
	.4byte _0808D9B8 @ case 84
	.4byte _0808D9B8 @ case 85
	.4byte _0808D9B8 @ case 86
	.4byte _0808D9B8 @ case 87
	.4byte _0808D9B8 @ case 88
	.4byte _0808D9B8 @ case 89
	.4byte _0808D9B8 @ case 90
	.4byte _0808D9B8 @ case 91
	.4byte _0808D9B8 @ case 92
	.4byte _0808D9B8 @ case 93
	.4byte _0808D9B8 @ case 94
	.4byte _0808D9B8 @ case 95
	.4byte _0808D9B8 @ case 96
	.4byte _0808D9B8 @ case 97
	.4byte _0808D9B8 @ case 98
	.4byte _0808D9B8 @ case 99
	.4byte _0808D9B8 @ case 100
	.4byte _0808D9B8 @ case 101
	.4byte _0808D9B8 @ case 102
	.4byte _0808D9B8 @ case 103
	.4byte _0808D9B8 @ case 104
	.4byte _0808D9B8 @ case 105
	.4byte _0808D9B8 @ case 106
	.4byte _0808D9B8 @ case 107
	.4byte _0808D9B8 @ case 108
	.4byte _0808D9B8 @ case 109
	.4byte _0808D9B8 @ case 110
	.4byte _0808D9B8 @ case 111
	.4byte _0808D9B8 @ case 112
	.4byte _0808D9B8 @ case 113
	.4byte _0808D9B8 @ case 114
	.4byte _0808D9B8 @ case 115
	.4byte _0808D9B8 @ case 116
	.4byte _0808D9B8 @ case 117
	.4byte _0808D9B8 @ case 118
	.4byte _0808D9B8 @ case 119
	.4byte _0808D9B8 @ case 120
	.4byte _0808D9B8 @ case 121
	.4byte _0808D9B8 @ case 122
	.4byte _0808D9B8 @ case 123
	.4byte _0808D9B8 @ case 124
	.4byte _0808D9B8 @ case 125
	.4byte _0808D9B8 @ case 126
	.4byte _0808D9B8 @ case 127
	.4byte _0808D7E0 @ case 128
_0808D75C:
	bl sub_808D3E4
	ldr r0, _0808D790 @ =0x08A737F8
	bl Proc_Find
	adds r3, r0, #0
	ldr r0, _0808D794 @ =0x08A73790
	adds r1, r6, #0
	adds r1, #0x48
	movs r5, #0
	ldrsh r4, [r1, r5]
	lsls r2, r4, #2
	subs r1, #0x14
	adds r1, r1, r2
	ldr r1, [r1]
	movs r5, #0x3c
	ldrsh r2, [r3, r5]
	movs r5, #0x3e
	ldrsh r3, [r3, r5]
	lsls r4, r4, #4
	adds r3, r3, r4
	movs r4, #6
	str r4, [sp]
	movs r4, #1
	b _0808D7C8
	.align 2, 0
_0808D790: .4byte 0x08A737F8
_0808D794: .4byte 0x08A73790
_0808D798:
	bl sub_808D3E4
	ldr r0, _0808D7D8 @ =0x08A737F8
	bl Proc_Find
	adds r3, r0, #0
	ldr r0, _0808D7DC @ =0x08A73790
	adds r1, r6, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r4, [r1, r2]
	lsls r2, r4, #2
	subs r1, #0x14
	adds r1, r1, r2
	ldr r1, [r1]
	movs r5, #0x3c
	ldrsh r2, [r3, r5]
	movs r5, #0x3e
	ldrsh r3, [r3, r5]
	lsls r4, r4, #4
	adds r3, r3, r4
	movs r4, #6
	str r4, [sp]
	movs r4, #2
_0808D7C8:
	str r4, [sp, #4]
	str r6, [sp, #8]
	bl sub_80923CC
_0808D7D0:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b _0808DA82
	.align 2, 0
_0808D7D8: .4byte 0x08A737F8
_0808D7DC: .4byte 0x08A73790
_0808D7E0:
	adds r1, r2, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r2, #1]
	cmp r0, #0x21
	bne _0808D802
	adds r2, r6, #0
	adds r2, #0x59
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	subs r7, #1
	b _0808DA7A
_0808D802:
	cmp r0, #4
	bne _0808D808
	b _0808D4C0
_0808D808:
	cmp r0, #0x25
	bne _0808D80E
	b _0808D4E8
_0808D80E:
	ldr r0, _0808D878 @ =0x08A737F8
	bl Proc_Find
	adds r4, r0, #0
	bl sub_808D3E4
	ldr r0, [r6, #0x2c]
	adds r1, r0, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _0808D82A
	adds r0, r1, #1
	str r0, [r6, #0x2c]
_0808D82A:
	cmp r4, #0
	bne _0808D830
	b _0808DA82
_0808D830:
	adds r0, r6, #0
	bl sub_808D42C
	ldr r0, [r6, #0x2c]
	add r2, sp, #0x10
	add r1, sp, #0xc
	bl sub_808CDEC
	ldr r0, [sp, #0xc]
	adds r1, r6, #0
	adds r1, #0x56
	movs r2, #0
	strb r0, [r1]
	ldr r0, [sp, #0x10]
	adds r1, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x54
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x46
	ldrh r0, [r0]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x58
	strb r2, [r0]
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
	b _0808DA82
	.align 2, 0
_0808D878: .4byte 0x08A737F8
_0808D87C:
	bl sub_808D3E4
	b _0808D916
_0808D882:
	bl sub_808D3E4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x55
	ldrb r1, [r0]
	adds r2, r6, #0
	adds r2, #0x48
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, #1
	cmp r1, r0
	bne _0808D8A2
	b _0808D4EE
_0808D8A2:
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b _0808DA7A
_0808D8AA:
	bl sub_808D3E4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #8
	strh r0, [r1]
	b _0808DA82
_0808D8BE:
	bl sub_808D3E4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x10
	strh r0, [r1]
	b _0808DA82
_0808D8D2:
	bl sub_808D3E4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x20
	strh r0, [r1]
	b _0808DA82
_0808D8E6:
	bl sub_808D3E4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x40
	strh r0, [r1]
	b _0808DA82
_0808D8FA:
	bl sub_808D3E4
	ldr r0, [r6, #0x2c]
	adds r1, r0, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _0808D90E
	adds r0, r1, #1
	str r0, [r6, #0x2c]
_0808D90E:
	ldr r0, [r6, #0x2c]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808D948
_0808D916:
	bl sub_808C834
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	bne _0808D924
	b _0808D500
_0808D924:
	ldr r0, _0808D940 @ =0x08A73798
	bl Proc_Find
	movs r1, #1
	bl Proc_Goto
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0808D944 @ =0x08A738D0
	bl Proc_EndEach
	b _0808DA82
	.align 2, 0
_0808D940: .4byte 0x08A73798
_0808D944: .4byte 0x08A738D0
_0808D948:
	bl sub_808C834
	movs r1, #0x10
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _0808D95A
	b _0808D508
_0808D95A:
	ldr r0, [r6, #0x2c]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808D964
	b _0808DA82
_0808D964:
	adds r0, r6, #0
	adds r0, #0x58
	strb r1, [r0]
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _0808DA82
_0808D974:
	bl sub_808D3E4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	ldr r0, _0808D9B4 @ =0x08A737F8
	bl Proc_Find
	adds r4, r6, #0
	adds r4, #0x52
	movs r5, #0x3c
	ldrsh r1, [r0, r5]
	ldrb r2, [r4]
	adds r1, r1, r2
	movs r3, #0x3e
	ldrsh r2, [r0, r3]
	adds r0, r6, #0
	adds r0, #0x48
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, #8
	adds r0, r6, #0
	bl sub_8007BD4
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_808CEA8
	b _0808DA82
	.align 2, 0
_0808D9B4: .4byte 0x08A737F8
_0808D9B8:
	bl sub_808C834
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808D9DE
	adds r5, r6, #0
	adds r5, #0x48
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #1
	bl sub_8003D90
	b _0808DA1A
_0808D9DE:
	adds r0, r6, #0
	adds r0, #0x59
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808DA02
	adds r5, r6, #0
	adds r5, #0x48
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xa
	bl sub_8003D90
	b _0808DA1A
_0808DA02:
	adds r5, r6, #0
	adds r5, #0x48
	movs r3, #0
	ldrsh r0, [r5, r3]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #6
	bl sub_8003D90
_0808DA1A:
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, [r6, #0x2c]
	bl sub_80040B8
	str r0, [r6, #0x2c]
	bl sub_8030BE4
	adds r4, r0, #0
	cmp r4, #1
	bne _0808DA40
	bl sub_8000CD8
	ands r0, r4
	cmp r0, #0
	beq _0808DA7A
_0808DA40:
	bl sub_808C834
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808DA68
	ldr r0, _0808DA60 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808DA7A
	ldr r0, _0808DA64 @ =0x000002E5
	bl m4aSongNumStart
	b _0808DA7A
	.align 2, 0
_0808DA60: .4byte 0x0202BCEC
_0808DA64: .4byte 0x000002E5
_0808DA68:
	ldr r0, _0808DA94 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808DA7A
	movs r0, #0x6e
	bl m4aSongNumStart
_0808DA7A:
	adds r7, #1
	cmp r7, r8
	bge _0808DA82
	b _0808D53C
_0808DA82:
	movs r0, #0
	bl SetTextFont
_0808DA88:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808DA94: .4byte 0x0202BCEC

