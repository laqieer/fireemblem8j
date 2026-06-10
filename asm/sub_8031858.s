	.syntax unified
	.set GetClassData, 0x0801911C + 1
	.set NextRN_N, 0x08000C58 + 1
	.section .text.sub_8031858, "ax", %progbits
@ sub_8031858 @ JP 0x08031858 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8031858
	.thumb_func
sub_8031858:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r6, #0
	mov r8, r6
	cmp r0, #7
	bhi _080318AC
	lsls r0, r0, #2
	ldr r1, _08031870 @ =_08031874
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08031870: .4byte _08031874
_08031874: @ jump table
	.4byte _08031894 @ case 0
	.4byte _08031894 @ case 1
	.4byte _08031894 @ case 2
	.4byte _0803189C @ case 3
	.4byte _080318AC @ case 4
	.4byte _080318A8 @ case 5
	.4byte _080318A8 @ case 6
	.4byte _080318A8 @ case 7
_08031894:
	ldr r0, _08031898 @ =0x085C5EDC
	b _080318AA
	.align 2, 0
_08031898: .4byte 0x085C5EDC
_0803189C:
	ldr r1, _080318A4 @ =0x085C5F2A
	mov r8, r1
	b _080318AC
	.align 2, 0
_080318A4: .4byte 0x085C5F2A
_080318A8:
	ldr r0, _080318F4 @ =0x085C5F02
_080318AA:
	mov r8, r0
_080318AC:
	ldr r0, _080318F8 @ =0x0203A8EC
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	ldr r5, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r5, r0
	movs r0, #0x80
	lsls r0, r0, #1
	ands r5, r0
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0
	beq _080318E6
	mov r4, r8
_080318CA:
	ldrb r0, [r4]
	bl GetClassData
	ldr r0, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, r5
	bne _080318DE
	adds r6, #1
_080318DE:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	bne _080318CA
_080318E6:
	adds r0, r6, #0
	bl NextRN_N
	adds r7, r0, #0
	movs r6, #0
	mov r4, r8
	b _08031900
	.align 2, 0
_080318F4: .4byte 0x085C5F02
_080318F8: .4byte 0x0203A8EC
_080318FC:
	adds r6, #1
_080318FE:
	adds r4, #1
_08031900:
	ldrb r0, [r4]
	bl GetClassData
	ldr r0, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, r5
	bne _080318FE
	cmp r6, r7
	bne _080318FC
	ldrb r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

