	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set SetEkrDragonStatusType, 0x08072034 + 1
	.section .text.sub_80730E4, "ax", %progbits
@ sub_80730E4 @ JP 0x080730E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80730E4
	.thumb_func
sub_80730E4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0807312C @ =0x0203E184
	ldr r0, _08073130 @ =0x0203E188
	ldr r7, [r0]
	ldr r6, [r1]
	mov sb, r7
	ldr r0, _08073134 @ =0x0203E100
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	movs r2, #2
	ldrsh r1, [r0, r2]
	mov sl, r1
	ldr r0, _08073138 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _08073112
	b _08073216
_08073112:
	cmp r0, #2
	ble _08073118
	b _08073216
_08073118:
	ldr r0, [r6, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x65
	beq _0807318C
	cmp r0, #0x65
	bgt _0807313C
	cmp r0, #0x3c
	beq _08073142
	b _080731AC
	.align 2, 0
_0807312C: .4byte 0x0203E184
_08073130: .4byte 0x0203E188
_08073134: .4byte 0x0203E100
_08073138: .4byte 0x0203E11C
_0807313C:
	cmp r0, #0x66
	beq _0807319C
	b _080731AC
_08073142:
	ldr r0, [r6]
	ldrb r0, [r0, #4]
	bl GetUnitFromCharId
	movs r5, #0xb
	ldrsb r5, [r0, r5]
	movs r4, #0xc0
	ands r5, r4
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	bl GetUnitFromCharId
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ands r0, r4
	cmp r5, r0
	beq _080731B6
	mov r2, r8
	cmp r2, #0
	beq _080731B6
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xaa
	bne _080731B6
	ldr r0, _08073188 @ =0x02000000
	ldr r0, [r0]
	movs r1, #3
	bl SetEkrDragonStatusType
	b _080731B6
	.align 2, 0
_08073188: .4byte 0x02000000
_0807318C:
	ldr r0, _08073198 @ =0x02000000
	ldr r0, [r0]
	movs r1, #1
	bl SetEkrDragonStatusType
	b _080731B6
	.align 2, 0
_08073198: .4byte 0x02000000
_0807319C:
	ldr r0, _080731A8 @ =0x02000000
	ldr r0, [r0]
	movs r1, #2
	bl SetEkrDragonStatusType
	b _080731B6
	.align 2, 0
_080731A8: .4byte 0x02000000
_080731AC:
	ldr r0, _08073208 @ =0x02000000
	ldr r0, [r0]
	movs r1, #0
	bl SetEkrDragonStatusType
_080731B6:
	mov r1, sb
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	bne _0807320C
	ldr r0, [r6]
	ldrb r0, [r0, #4]
	bl GetUnitFromCharId
	movs r5, #0xb
	ldrsb r5, [r0, r5]
	movs r4, #0xc0
	ands r5, r4
	mov r2, sb
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl GetUnitFromCharId
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ands r0, r4
	cmp r5, r0
	beq _08073216
	mov r0, sl
	cmp r0, #0
	beq _08073216
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xaa
	bne _08073216
	ldr r0, _08073208 @ =0x02000000
	ldr r0, [r0, #8]
	movs r1, #3
	bl SetEkrDragonStatusType
	b _08073216
	.align 2, 0
_08073208: .4byte 0x02000000
_0807320C:
	ldr r0, _08073224 @ =0x02000000
	ldr r0, [r0, #8]
	movs r1, #0
	bl SetEkrDragonStatusType
_08073216:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073224: .4byte 0x02000000

