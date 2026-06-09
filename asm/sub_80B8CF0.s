	.syntax unified
	.set SetTalkFlag, 0x080069AC + 1
	.set sub_800687C, 0x0800687C + 1
	.set sub_8006890, 0x08006890 + 1
	.set sub_8006A14, 0x08006A14 + 1
	.set sub_800773C, 0x0800773C + 1
	.set sub_800814C, 0x0800814C + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80B8CF0, "ax", %progbits
@ sub_80B8CF0 @ JP 0x080B8CF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B8CF0
	.thumb_func
sub_80B8CF0:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _080B8D44 @ =0x08ABC778
	adds r0, r5, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r4, r4, r0
	bl sub_800687C
	bl sub_800814C
	adds r0, r4, #0
	bl sub_8009FA8
	adds r2, r0, #0
	movs r0, #8
	movs r1, #2
	adds r3, r5, #0
	bl sub_8006890
	movs r0, #0
	bl sub_8006A14
	movs r0, #1
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #1
	bl sub_800773C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8D44: .4byte 0x08ABC778

