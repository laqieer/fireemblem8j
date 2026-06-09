	.syntax unified
	.set GetChapterTitleExtra, 0x0808BA78 + 1
	.set IsGameNotFirstChapter, 0x080A9CD4 + 1
	.set IsValidSuspendSave, 0x080AA7C0 + 1
	.set ReadSuspendSavePlaySt, 0x080AA814 + 1
	.set memset, 0x080D6968 + 1
	.set sub_80A9C30, 0x080A9C30 + 1
	.set sub_80A9C44, 0x080A9C44 + 1
	.set sub_80A9C8C, 0x080A9C8C + 1
	.set sub_80A9CA8, 0x080A9CA8 + 1
	.set sub_80C2030, 0x080C2030 + 1
	.section .text.sub_80B06C8, "ax", %progbits
@ sub_80B06C8 @ JP 0x080B06C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B06C8
	.thumb_func
sub_80B06C8:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x120
	adds r7, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	cmp r5, #2
	bls _080B06DA
	b _080B07FC
_080B06DA:
	adds r0, r5, #0
	bl sub_80A9C30
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _080B07B8
	adds r0, r5, #0
	mov r1, sp
	bl sub_80A9C44
	mov r0, sp
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	ldrb r1, [r0, #0x14]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080B0720
	mov r0, sp
	adds r0, #0x4a
	ldrb r1, [r0]
	movs r0, #0xe
	ands r0, r1
	cmp r0, #8
	bne _080B0720
	add r4, sp, #0x4c
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80A9C8C
	adds r0, r4, #0
	bl sub_80C2030
	adds r2, r0, #0
_080B0720:
	mov r0, sp
	movs r4, #0xe
	ldrsb r4, [r0, r4]
	movs r5, #0
	strb r2, [r0, #0xe]
	bl GetChapterTitleExtra
	adds r1, r7, #0
	adds r1, #0x37
	adds r1, r1, r6
	strb r0, [r1]
	mov r0, sp
	strb r4, [r0, #0xe]
	lsls r1, r6, #2
	adds r0, r7, #0
	adds r0, #0x48
	adds r0, r0, r1
	ldr r1, [sp]
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x3a
	adds r4, r0, r6
	strb r5, [r4]
	adds r0, r6, #0
	bl IsGameNotFirstChapter
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B0762
	ldrb r0, [r4]
	movs r1, #1
	orrs r0, r1
	strb r0, [r4]
_080B0762:
	adds r0, r6, #0
	bl sub_80A9CA8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B0776
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
_080B0776:
	mov r0, sp
	ldrb r1, [r0, #0x14]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080B078A
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
_080B078A:
	ldr r0, _080B07AC @ =0x02000940
	adds r0, r6, r0
	mov r1, sp
	ldrb r1, [r1, #0x14]
	strb r1, [r0]
	ldr r0, _080B07B0 @ =0x02000944
	adds r0, r6, r0
	mov r1, sp
	ldrb r1, [r1, #0x1b]
	strb r1, [r0]
	lsls r1, r6, #3
	ldr r0, _080B07B4 @ =0x02000948
	adds r1, r1, r0
	add r0, sp, #0x40
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	b _080B0832
	.align 2, 0
_080B07AC: .4byte 0x02000940
_080B07B0: .4byte 0x02000944
_080B07B4: .4byte 0x02000948
_080B07B8:
	adds r0, r7, #0
	adds r0, #0x37
	adds r0, r0, r6
	movs r1, #0xff
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0x3a
	adds r0, r0, r6
	strb r2, [r0]
	lsls r1, r6, #2
	adds r0, r7, #0
	adds r0, #0x48
	adds r0, r0, r1
	str r2, [r0]
	ldr r0, _080B07F0 @ =0x02000940
	adds r0, r6, r0
	strb r2, [r0]
	ldr r0, _080B07F4 @ =0x02000944
	adds r0, r6, r0
	strb r2, [r0]
	lsls r0, r6, #3
	ldr r1, _080B07F8 @ =0x02000948
	adds r0, r0, r1
	movs r1, #0
	movs r2, #8
	bl memset
	b _080B0832
	.align 2, 0
_080B07F0: .4byte 0x02000940
_080B07F4: .4byte 0x02000944
_080B07F8: .4byte 0x02000948
_080B07FC:
	adds r4, r7, #0
	adds r4, #0x44
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bne _080B0832
	movs r0, #3
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B082E
	movs r0, #3
	mov r1, sp
	bl ReadSuspendSavePlaySt
	mov r0, sp
	ldrb r0, [r0, #0xc]
	adds r1, r7, #0
	adds r1, #0x3f
	strb r0, [r1]
	ldr r0, [sp]
	str r0, [r7, #0x54]
	b _080B0832
_080B082E:
	movs r0, #0xf0
	strh r0, [r4]
_080B0832:
	add sp, #0x120
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

