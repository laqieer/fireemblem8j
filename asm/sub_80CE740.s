	.syntax unified
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80CE740, "ax", %progbits
@ sub_80CE740 @ JP 0x080CE740 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CE740
	.thumb_func
sub_80CE740:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #5
	bl sub_80D637C
	adds r3, r0, #0
	movs r0, #5
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl sub_8012E84
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080CE774
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
	b _080CE786
_080CE774:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
_080CE786:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080CE7D8
	cmp r0, #2
	bgt _080CE79C
	cmp r0, #1
	beq _080CE7A6
	b _080CE85C
_080CE79C:
	cmp r0, #3
	beq _080CE80C
	cmp r0, #4
	beq _080CE840
	b _080CE85C
_080CE7A6:
	ldr r0, _080CE7C4 @ =0x08B83A14
	ldr r1, _080CE7C8 @ =0x06010000
	bl sub_8013008
	ldr r0, _080CE7CC @ =0x08B84518
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE7D0 @ =0x08B84170
	ldr r1, _080CE7D4 @ =0x06010F00
	bl sub_8013008
	b _080CE85C
	.align 2, 0
_080CE7C4: .4byte 0x08B83A14
_080CE7C8: .4byte 0x06010000
_080CE7CC: .4byte 0x08B84518
_080CE7D0: .4byte 0x08B84170
_080CE7D4: .4byte 0x06010F00
_080CE7D8:
	ldr r0, _080CE7F8 @ =0x08B84538
	ldr r1, _080CE7FC @ =0x06011E00
	bl sub_8013008
	ldr r0, _080CE800 @ =0x08B84F34
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE804 @ =0x08B84B80
	ldr r1, _080CE808 @ =0x06012D00
	bl sub_8013008
	b _080CE85C
	.align 2, 0
_080CE7F8: .4byte 0x08B84538
_080CE7FC: .4byte 0x06011E00
_080CE800: .4byte 0x08B84F34
_080CE804: .4byte 0x08B84B80
_080CE808: .4byte 0x06012D00
_080CE80C:
	ldr r0, _080CE82C @ =0x08B84F54
	ldr r1, _080CE830 @ =0x06013C00
	bl sub_8013008
	ldr r0, _080CE834 @ =0x08B85A10
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE838 @ =0x08B856B4
	ldr r1, _080CE83C @ =0x06014B00
	bl sub_8013008
	b _080CE85C
	.align 2, 0
_080CE82C: .4byte 0x08B84F54
_080CE830: .4byte 0x06013C00
_080CE834: .4byte 0x08B85A10
_080CE838: .4byte 0x08B856B4
_080CE83C: .4byte 0x06014B00
_080CE840:
	ldr r0, _080CE870 @ =0x08B85A30
	ldr r1, _080CE874 @ =0x06015A00
	bl sub_8013008
	ldr r0, _080CE878 @ =0x08B86488
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE87C @ =0x08B860EC
	ldr r1, _080CE880 @ =0x06016900
	bl sub_8013008
_080CE85C:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xf
	bne _080CE884
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CE888
	.align 2, 0
_080CE870: .4byte 0x08B85A30
_080CE874: .4byte 0x06015A00
_080CE878: .4byte 0x08B86488
_080CE87C: .4byte 0x08B860EC
_080CE880: .4byte 0x06016900
_080CE884:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CE888:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

