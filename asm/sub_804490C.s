	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set MemCpy, 0x08014C60 + 1
	.set SetUnitStatus, 0x08017680 + 1
	.set sub_801759C, 0x0801759C + 1
	.set sub_80AB2F4, 0x080AB2F4 + 1
	.section .text.sub_804490C, "ax", %progbits
@ sub_804490C @ JP 0x0804490C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804490C
	.thumb_func
sub_804490C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	mov sb, r1
	movs r0, #0x81
	bl GetUnit
	mov r8, r0
	mov r4, r8
	movs r6, #4
_08044926:
	adds r0, r4, #0
	bl sub_801759C
	adds r4, #0x48
	subs r6, #1
	cmp r6, #0
	bge _08044926
	movs r6, #0
	mov r7, r8
_08044938:
	ldr r0, _08044988 @ =0x0203E878
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08044966
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r4, [r5, #0xc]
	movs r0, #8
	ands r4, r0
	cmp r4, #0
	bne _08044966
	adds r0, r5, #0
	movs r1, #0
	bl SetUnitStatus
	str r4, [r5, #0xc]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0x48
	bl MemCpy
_08044966:
	adds r7, #0x48
	adds r6, #1
	cmp r6, #4
	ble _08044938
	mov r0, sb
	mov r1, r8
	mov r2, sl
	bl sub_80AB2F4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044988: .4byte 0x0203E878

