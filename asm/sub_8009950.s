	.syntax unified
	.set IsValidSuspendSave, 0x080AA7C0 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set ReadSuspendSave, 0x080AA62C + 1
	.set StartBgmVolumeChange, 0x08002680 + 1
	.set sub_8002398, 0x08002398 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8009950, "ax", %progbits
@ sub_8009950 @ JP 0x08009950 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009950
	.thumb_func
sub_8009950:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800996C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08009970
	adds r0, r4, #0
	bl sub_8002DE4
	b _080099B4
	.align 2, 0
_0800996C: .4byte 0x085775CC
_08009970:
	ldrh r0, [r4, #0x2e]
	subs r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080099B4
	movs r0, #3
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08009998
	movs r0, #3
	bl ReadSuspendSave
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _080099B4
_08009998:
	movs r0, #0x43
	movs r1, #0
	bl sub_8002398
	movs r0, #0
	movs r1, #0xc0
	movs r2, #0x3c
	movs r3, #0
	bl StartBgmVolumeChange
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_080099B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

