	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set SetBoxDialogueSize, 0x0808CB48 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_808DB80, "ax", %progbits
@ sub_808DB80 @ JP 0x0808DB80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808DB80
	.thumb_func
sub_808DB80:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _0808DC10 @ =0x08A737F8
	bl Proc_Find
	adds r6, r0, #0
	adds r5, r4, #0
	adds r5, #0x58
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	cmp r6, #0
	beq _0808DBD8
	adds r0, r4, #0
	adds r0, #0x54
	ldrb r0, [r0]
	ldrb r3, [r5]
	movs r2, #2
	subs r2, r2, r3
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	muls r0, r3, r0
	adds r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x55
	ldrb r0, [r0]
	muls r2, r0, r2
	adds r0, r4, #0
	adds r0, #0x57
	ldrb r0, [r0]
	muls r0, r3, r0
	adds r2, r2, r0
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r0, r6, #0
	bl SetBoxDialogueSize
_0808DBD8:
	ldrb r0, [r5]
	cmp r0, #2
	bne _0808DC08
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	lsrs r0, r0, #3
	adds r1, r4, #0
	adds r1, #0x54
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsrs r0, r0, #4
	adds r1, r0, #0
	cmp r0, #5
	bls _0808DBFC
	movs r1, #5
_0808DBFC:
	adds r0, r4, #0
	adds r0, #0x55
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8002DE4
_0808DC08:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808DC10: .4byte 0x08A737F8

