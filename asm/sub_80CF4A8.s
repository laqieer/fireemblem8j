	.syntax unified
	.set BlendPaletteToColor, 0x080CB8BC + 1
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set SetBackgroundMapDataOffset, 0x08000FB4 + 1
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80CB3C0, 0x080CB3C0 + 1
	.set sub_80CC178, 0x080CC178 + 1
	.section .text.sub_80CF4A8, "ax", %progbits
@ sub_80CF4A8 @ JP 0x080CF4A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CF4A8
	.thumb_func
sub_80CF4A8:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	cmp r0, #4
	bhi _080CF50A
	lsls r0, r0, #2
	ldr r1, _080CF4C0 @ =_080CF4C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CF4C0: .4byte _080CF4C4
_080CF4C4: @ jump table
	.4byte _080CF50A @ case 0
	.4byte _080CF4D8 @ case 1
	.4byte _080CF4E6 @ case 2
	.4byte _080CF4F4 @ case 3
	.4byte _080CF502 @ case 4
_080CF4D8:
	movs r0, #0xd8
	lsls r0, r0, #1
	movs r1, #0xc4
	lsls r1, r1, #1
	bl sub_80CC178
	b _080CF50A
_080CF4E6:
	movs r0, #0xf8
	lsls r0, r0, #1
	movs r1, #0xd8
	lsls r1, r1, #1
	bl sub_80CC178
	b _080CF50A
_080CF4F4:
	movs r0, #0x8c
	lsls r0, r0, #2
	movs r1, #0xf8
	lsls r1, r1, #1
	bl sub_80CC178
	b _080CF50A
_080CF502:
	movs r0, #0x8c
	lsls r0, r0, #2
	strh r0, [r6, #0x3a]
	strh r0, [r6, #0x38]
_080CF50A:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8e
	bls _080CF51C
	movs r0, #0xae
	movs r1, #0xa
	movs r2, #4
	movs r3, #9
	bl sub_80CB3C0
_080CF51C:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8d
	bls _080CF52E
	movs r0, #0x38
	movs r1, #0x28
	movs r2, #4
	movs r3, #7
	bl sub_80CB3C0
_080CF52E:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8c
	bls _080CF540
	movs r0, #0x9c
	movs r1, #0x3a
	movs r2, #3
	movs r3, #3
	bl sub_80CB3C0
_080CF540:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8b
	bls _080CF552
	movs r0, #0x22
	movs r1, #0
	movs r2, #4
	movs r3, #1
	bl sub_80CB3C0
_080CF552:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8a
	bls _080CF564
	movs r0, #0xd2
	movs r1, #0x10
	movs r2, #4
	movs r3, #5
	bl sub_80CB3C0
_080CF564:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x89
	bls _080CF576
	movs r0, #0xc
	movs r1, #0x1a
	movs r2, #3
	movs r3, #1
	bl sub_80CB3C0
_080CF576:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x88
	bls _080CF588
	movs r0, #0xcc
	movs r1, #0x2a
	movs r2, #3
	movs r3, #4
	bl sub_80CB3C0
_080CF588:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x87
	bls _080CF59A
	movs r0, #0x60
	movs r1, #0
	movs r2, #4
	movs r3, #0
	bl sub_80CB3C0
_080CF59A:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x86
	bls _080CF5AC
	movs r0, #0xe4
	movs r1, #0x10
	movs r2, #4
	movs r3, #0xb
	bl sub_80CB3C0
_080CF5AC:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x85
	bls _080CF5BE
	movs r0, #0x58
	movs r1, #0x1e
	movs r2, #3
	movs r3, #3
	bl sub_80CB3C0
_080CF5BE:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x84
	bls _080CF5D0
	movs r0, #0x54
	movs r1, #0x2e
	movs r2, #2
	movs r3, #1
	bl sub_80CB3C0
_080CF5D0:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x83
	bls _080CF5E2
	movs r0, #0
	movs r1, #2
	movs r2, #4
	movs r3, #2
	bl sub_80CB3C0
_080CF5E2:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x82
	bls _080CF5F4
	movs r0, #0xc6
	movs r1, #0x18
	movs r2, #4
	movs r3, #9
	bl sub_80CB3C0
_080CF5F4:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x81
	bls _080CF606
	movs r0, #0x90
	movs r1, #0x22
	movs r2, #3
	movs r3, #5
	bl sub_80CB3C0
_080CF606:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x80
	bls _080CF618
	movs r0, #0xa8
	movs r1, #0x44
	movs r2, #2
	movs r3, #0
	bl sub_80CB3C0
_080CF618:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x7f
	bls _080CF62A
	movs r0, #0xca
	movs r1, #2
	movs r2, #4
	movs r3, #7
	bl sub_80CB3C0
_080CF62A:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x7e
	bls _080CF63C
	movs r0, #0x26
	movs r1, #0x18
	movs r2, #4
	movs r3, #2
	bl sub_80CB3C0
_080CF63C:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x7d
	bls _080CF64E
	movs r0, #0x80
	movs r1, #0x26
	movs r2, #3
	movs r3, #0
	bl sub_80CB3C0
_080CF64E:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x7b
	bls _080CF660
	movs r0, #0x80
	movs r1, #0x32
	movs r2, #2
	movs r3, #5
	bl sub_80CB3C0
_080CF660:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x79
	bls _080CF672
	movs r0, #0x86
	movs r1, #6
	movs r2, #4
	movs r3, #0
	bl sub_80CB3C0
_080CF672:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x77
	bls _080CF684
	movs r0, #0x98
	movs r1, #0x16
	movs r2, #4
	movs r3, #1
	bl sub_80CB3C0
_080CF684:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x75
	bls _080CF696
	movs r0, #0xe8
	movs r1, #0x16
	movs r2, #3
	movs r3, #3
	bl sub_80CB3C0
_080CF696:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x73
	bls _080CF6A8
	movs r0, #0x64
	movs r1, #0x48
	movs r2, #2
	movs r3, #1
	bl sub_80CB3C0
_080CF6A8:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x71
	bls _080CF6BA
	movs r0, #0x70
	movs r1, #6
	movs r2, #4
	movs r3, #0xa
	bl sub_80CB3C0
_080CF6BA:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x6f
	bls _080CF6CC
	movs r0, #0x40
	movs r1, #0x14
	movs r2, #4
	movs r3, #8
	bl sub_80CB3C0
_080CF6CC:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x6d
	bls _080CF6DE
	movs r0, #0
	movs r1, #0x2e
	movs r2, #3
	movs r3, #4
	bl sub_80CB3C0
_080CF6DE:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x6b
	bls _080CF6F0
	movs r0, #0x2c
	movs r1, #0x4a
	movs r2, #2
	movs r3, #4
	bl sub_80CB3C0
_080CF6F0:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x69
	bls _080CF702
	movs r0, #0x40
	movs r1, #8
	movs r2, #4
	movs r3, #6
	bl sub_80CB3C0
_080CF702:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x67
	bls _080CF714
	movs r0, #0x78
	movs r1, #0x1a
	movs r2, #4
	movs r3, #2
	bl sub_80CB3C0
_080CF714:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x65
	bls _080CF726
	movs r0, #0x24
	movs r1, #0x32
	movs r2, #3
	movs r3, #2
	bl sub_80CB3C0
_080CF726:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x62
	bls _080CF738
	movs r0, #0xe
	movs r1, #0x4e
	movs r2, #2
	movs r3, #0
	bl sub_80CB3C0
_080CF738:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x5f
	bls _080CF74A
	movs r0, #0x16
	movs r1, #0xa
	movs r2, #4
	movs r3, #4
	bl sub_80CB3C0
_080CF74A:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x5c
	bls _080CF75C
	movs r0, #0xb4
	movs r1, #0x28
	movs r2, #4
	movs r3, #1
	bl sub_80CB3C0
_080CF75C:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x59
	bls _080CF76E
	movs r0, #0x42
	movs r1, #0x36
	movs r2, #3
	movs r3, #1
	bl sub_80CB3C0
_080CF76E:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x55
	bls _080CF780
	movs r0, #0xdc
	movs r1, #0x32
	movs r2, #2
	movs r3, #2
	bl sub_80CB3C0
_080CF780:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x51
	bls _080CF792
	movs r0, #0xc8
	movs r1, #0x48
	movs r2, #1
	movs r3, #0
	bl sub_80CB3C0
_080CF792:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x4c
	bls _080CF7A4
	movs r0, #0x38
	movs r1, #0x28
	movs r2, #4
	movs r3, #0
	bl sub_80CB3C0
_080CF7A4:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x47
	bls _080CF7B6
	movs r0, #0x8c
	movs r1, #0x54
	movs r2, #1
	movs r3, #2
	bl sub_80CB3C0
_080CF7B6:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x41
	bls _080CF7C8
	movs r0, #0x10
	movs r1, #0x64
	movs r2, #1
	movs r3, #1
	bl sub_80CB3C0
_080CF7C8:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x37
	bls _080CF7DA
	movs r0, #0
	movs r1, #0x7e
	movs r2, #0
	movs r3, #1
	bl sub_80CB3C0
_080CF7DA:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x31
	bls _080CF7EC
	movs r0, #0xa0
	movs r1, #0x78
	movs r2, #0
	movs r3, #2
	bl sub_80CB3C0
_080CF7EC:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x1d
	bls _080CF7FE
	movs r0, #0x58
	movs r1, #0x70
	movs r2, #0
	movs r3, #0
	bl sub_80CB3C0
_080CF7FE:
	ldrh r0, [r6, #0x2a]
	adds r4, r0, #0
	subs r4, #0x52
	cmp r4, #0
	bne _080CF83C
	ldr r2, _080CF8E0 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundTileDataOffset
	movs r1, #0xe8
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundMapDataOffset
_080CF83C:
	cmp r4, #0x5f
	bhi _080CF874
	ldr r0, _080CF8E4 @ =0x08BAA1E0
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	movs r0, #0x5f
	str r0, [sp]
	movs r0, #4
	movs r1, #0x10
	movs r2, #0xc
	adds r3, r4, #0
	bl sub_8012E84
	ldr r5, _080CF8E8 @ =0x020228A8
	lsls r7, r0, #0x10
	movs r4, #7
_080CF862:
	adds r0, r5, #0
	movs r1, #0
	lsrs r2, r7, #0x10
	bl BlendPaletteToColor
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080CF862
_080CF874:
	ldrh r0, [r6, #0x2a]
	adds r4, r0, #0
	subs r4, #0xb1
	cmp r4, #0
	bne _080CF8A8
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
_080CF8A8:
	cmp r4, #0x20
	bhi _080CF8CC
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	adds r3, r4, #0
	bl sub_8012E84
	ldr r2, _080CF8E0 @ =0x03003020
	adds r1, r2, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x45
	strb r1, [r2]
_080CF8CC:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0xd1
	bne _080CF8EC
	movs r0, #0
	strh r0, [r6, #0x2a]
	adds r0, r6, #0
	bl sub_8002DE4
	b _080CF8F0
	.align 2, 0
_080CF8E0: .4byte 0x03003020
_080CF8E4: .4byte 0x08BAA1E0
_080CF8E8: .4byte 0x020228A8
_080CF8EC:
	adds r0, #1
	strh r0, [r6, #0x2a]
_080CF8F0:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

